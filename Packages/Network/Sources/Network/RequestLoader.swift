
import class Foundation.URLSessionConfiguration
import class Foundation.URLSession
import struct Foundation.URLRequest
import struct Foundation.URL
import struct Foundation.URLComponents
import struct Foundation.URLQueryItem
import struct Foundation.Data
import class Foundation.URLResponse
import class Foundation.JSONSerialization
import struct Foundation.URLError
import enum Entities.NetworkError

public struct RequestLoader {
    let baseURL: URL
    let standardHeaders: [String: String]?
    
    public init(
        baseURL: URL,
        standardHeaders: [String : String]?
    ) {
        self.baseURL = baseURL
        self.standardHeaders = standardHeaders
    }
}

// MARK: - Load Request
public extension RequestLoader {
    func load<Response>(
        request: Request<Response>,
        completion: @escaping (Result<Response, Error>) -> ()
    ) {
        let urlRequest = createUrlRequest(from: request)
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .reloadIgnoringLocalCacheData
        config.urlCache = nil

        let session = URLSession(configuration: config)
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            do {
                let data = try self.handleResponse(
                    data: data,
                    response: response,
                    error: error
                )
                let model = try request.decoder(data, request.decodingInfo)
                completion(.success(model))
            } catch {
                #if DEBUG
                    print(error)
                #endif
                completion(.failure(error))
            }
        }
        task.resume()
    }
}

// MARK: - Helpers
private extension RequestLoader {
    func createUrlRequest<Response>(
        from request: Request<Response>
    ) -> URLRequest {
        var url = baseURL.appendingPathComponent(request.path)
        if let query = request.query {
            var components = URLComponents(
                url: url,
                resolvingAgainstBaseURL: false
            )
            components?.queryItems = query.map(URLQueryItem.init)
            url = components?.url ?? url
        }
        var urlRequest = URLRequest(url: url)
        if let headers = standardHeaders {
            headers.forEach {
                urlRequest.addValue($1, forHTTPHeaderField: $0)
            }
        }
        if let headers = request.headers {
            headers.forEach {
                urlRequest.addValue($1, forHTTPHeaderField: $0)
            }
        }
        if let body = request.body {
            urlRequest.httpBody = body.json
        }
        urlRequest.httpMethod = request.httpMethod.rawValue
        return urlRequest
    }
    
    func handleResponse(
        data: Data?,
        response: URLResponse?,
        error: Error?
    ) throws -> Data {
        if let error = error as? URLError {
            if error.code == URLError.Code.notConnectedToInternet {
                throw NetworkError.noConnection
            }
            throw NetworkError.url(error)
        }
        return data ?? Data()
    }
}

// MARK: - Extensions
private extension Dictionary {
    var json: Data? {
        try? JSONSerialization.data(withJSONObject: self)
    }
}

// MARK: - RequestLoader
public let requestLoader = RequestLoader(
    baseURL: URL(string: "https://s3-eu-west-1.amazonaws.com/")!,
    standardHeaders: [:]
)
