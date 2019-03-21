import Foundation

public enum CustomResult<ResultType> {
    case success(ResultType)
    case failure(Error?)
}

public extension CustomResult {
    func map<T>(_ transform: (ResultType) -> T) -> CustomResult<T> {
        switch self {
        case let .success(value): return .success(transform(value))
        case let .failure(error): return .failure(error)
        }
    }
    
    func flatMap<T>(_ transform: (ResultType) -> CustomResult<T>) -> CustomResult<T> {
        switch self {
        case let .success(value): return transform(value)
        case let .failure(error): return .failure(error)
        }
    }
}
