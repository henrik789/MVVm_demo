import Foundation

class NetworkService {
    init() { }
    func addRequest(_ request: Request, completion: @escaping (Any)-> Void) {
        
        do {
            if let file = URL(string: "https://jsonplaceholder.typicode.com/users") {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let object = json as? [String: Any] {
                    // json is a dictionary
                    print(object)
                } else if let users = json as? [Any]{
                    completion(users)
                }else {
                    print("JSON is invalid")
                }
            } else {
                print("no file")
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}


//        var allJSON = Data()
//        let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
//        let configuration = URLSessionConfiguration.default
//        configuration.waitsForConnectivity = true
//        let session = URLSession(configuration: configuration)
//
//        let task = session.dataTask(with: url) {
//
//            (data, response, error) in
//            guard let httpResponse = response as? HTTPURLResponse,
//                httpResponse.statusCode == 200 else {
//                    return
//            }
//
//            guard let data = data else {
//                print(error.debugDescription)
//                return
//            }
//            if let json = try JSONSerialization.
//
////            if let result = NSString(data: data, encoding: String.Encoding.utf8.rawValue) as String? {
////                allJSON = data
////                print(result)
////            }
////            completion(allJSON)
//        }
//
//        task.resume()


