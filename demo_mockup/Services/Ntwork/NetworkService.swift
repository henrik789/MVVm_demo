import Foundation

class NetworkService {
    init() { }
    func addRequest(_ request: Request, completion: @escaping (Any)-> Void) {
        
        let usersURL = "https://jsonplaceholder.typicode.com/users"

        guard let url = URL(string: usersURL) else {return}
        let task = URLSession.shared.dataTask(with: url)
        { (data, response, error) in
            guard let dataResponse = data,
                error == nil else {
                    print(error?.localizedDescription ?? "Response Error")
                    return }
            do{
                let jsonResponse = try JSONSerialization.jsonObject(with: dataResponse, options: [])
                completion(jsonResponse)
            } catch let parsingError {
                print("Error", parsingError)
            }
        }
        task.resume()
    }
}


//        do {
//            if let file = URL(string: "https://jsonplaceholder.typicode.com/users") {
//                let data = try Data(contentsOf: file)
//                let json = try JSONSerialization.jsonObject(with: data, options: [])
//                if let object = json as? [String: Any] {
//                    // TODO: errorhandling if network fails
//                    print(object)
//                } else if let users = json as? [Any]{
//                    completion(users)
//                }else {
//                    print("JSON is invalid")
//                }
//            } else {
//                print("no file")
//            }
//        } catch {
//            print(error.localizedDescription)
//        }



//var allJSON = Data()
//let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
//let configuration = URLSessionConfiguration.default
//configuration.waitsForConnectivity = true
//let session = URLSession(configuration: configuration)
//
//let task = session.dataTask(with: url) {
//    (data, response, error) in
//    guard let httpResponse = response as? HTTPURLResponse,
//        httpResponse.statusCode == 200 else {
//            return
//    }
//
//    guard let data = data else {
//        print(error.debugDescription)
//        return
//    }
//    let json = try JSONSerialization.jsonObject(with: data, options: [])
//    if let object = json as? [String: Any] {
//        // TODO: errorhandling if network fails
//        print(object)
//    } else if let users = json as? [Any]{
//        completion(users)
//    }else {
//        print("JSON is invalid")
//    } catch {
//        print(error.localizedDescription)
//}
//    }
//
//    task.resume()
