import Alamofire


public final class ImageClient {
    enum CustomError: CustomNSError {
        case unknown
        case notValidImageLocation
    }
    
    public init() {}
    
    public func image(with url: URL? = nil, string: String? = nil, completion: @escaping (CustomResult<UIImage>) -> ()) {
        guard let url = url ?? string.flatMap({ URL(string: $0) }) else {
            return completion(.failure(CustomError.notValidImageLocation))
        }
        
        Alamofire.request(url).response { (response) in
            if let data = response.data, let image = UIImage(data: data) {
                completion(.success(image))
            } else {
                completion(.failure(response.error))
            }
        }
    }
    
}
