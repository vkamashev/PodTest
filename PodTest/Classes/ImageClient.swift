import Alamofire


public final class ImageClient {
    public init() {}
    
    public func image(with url: URL, completion: @escaping (CustomResult<UIImage>) -> ()) {
        Alamofire.request(url).response { (response) in
            if let data = response.data, let image = UIImage(data: data) {
                completion(.success(image))
            } else {
                completion(.failure(response.error))
            }
        }
    }
    
}
