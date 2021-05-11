
import enum Entities.APIError

import enum Entities.NetworkError

public extension Result where Success: Decodable {
    
    /// A operator to check Network Connection Error. If true, it will give an opportunity to transform from failure to success.
    func onNetworkError(
        _ transform: () -> Result<Success?, Error>
    ) -> Result<Success, APIError> {
        switch self {
        case let .success(success):
            return .success(success)
        case let .failure(error):
            if let networkError = error as? NetworkError,
               case .noConnection = networkError {
                let transform = transform()
                return checkValue(transform)
            }
            return .failure(convertError(error))
        }
    }
    
    fileprivate func checkValue(
        _ transform: Result<Success?, Error>
    ) -> Result<Success, APIError> {
        switch transform {
        case let .success(success):
            guard let _success = success else {
                return .failure(convertError(NetworkError.noConnection))
            }
            return .success(_success)
        default:
            return .failure(convertError(NetworkError.noConnection))
        }
    }
}
