import Foundation

class NetworkService {
    init() { }
    func addRequest(_ request: Request, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        let task = URLSession.shared.dataTask(with: request.url){ (data, response, error) in
            completion(data, response, error)
        }
        task.resume()
    }
}
