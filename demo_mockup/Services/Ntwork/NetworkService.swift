import Foundation

class NetworkService {
    init() { }
    func addRequest(_ request: Request, completion: @escaping (Any?, URLResponse?, Error?) -> Void) {
        let task = URLSession.shared.dataTask(with: request.url){ (data, response, error) in
            
            guard let dataResponse = data else {
                completion(nil, response, error)
                return
            }
            
            do{
                let data = try JSONSerialization.jsonObject(with: dataResponse, options: [])
                completion(data, response, error)
            } catch {
                completion(nil, response, error)
            }
        }
        task.resume()
    }
}
