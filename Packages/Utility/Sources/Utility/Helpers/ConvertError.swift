

import enum Entities.APIError
import enum Entities.NetworkError

// MARK: - Error Mapping
public func convertError(_ error: Error) -> APIError {
    if let apiError = error as? APIError {
        return apiError
    }
    if let networkError = error as? NetworkError {
        switch networkError {
        case .noConnection:
            return .noConnection
        case .url(let error):
            return .url(error)
        }
    }
    return .unknown
}
