import Foundation

class NetworkService {
    init() { }
    func addRequest(_ request: Request, completion: @escaping (Any)-> Void) {
        
        var allJSON = Data()
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
        let configuration = URLSessionConfiguration.default
        configuration.waitsForConnectivity = true
        let session = URLSession(configuration: configuration)
        
        let task = session.dataTask(with: url) {
            
            (data, response, error) in
            guard let httpResponse = response as? HTTPURLResponse,
                httpResponse.statusCode == 200 else {
                    return
            }
            
            guard let data = data else {
                print(error.debugDescription)
                return
            }
            if let json = try JSONSerialization.
            
//            if let result = NSString(data: data, encoding: String.Encoding.utf8.rawValue) as String? {
//                allJSON = data
//                print(result)
//            }
//            completion(allJSON)
        }
        
        task.resume()
    }
}


