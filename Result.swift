import Foundation

public enum CustomResult<ResultType> {
    case success(ResultType)
    case failure(Error?)
}
