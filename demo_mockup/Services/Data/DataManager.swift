import Foundation

private let badResponseError = NSError(domain: "Bad network response", code: 2, userInfo: nil)
// Handle all data
class  DataManager {
    
    let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func getUsers(completion: @escaping ([User], Error?) -> Void) {
        networkService.addRequest(.getUsers) { (data, response, error)  in
            guard let data = data as? [[String: Any]], error == nil else {
                let error = error ?? badResponseError
                completion([], error)
                return
            }
            
            var users = [User]()
            for userJSON in data {
                if let user = try? User(json: userJSON) {
                    users.append(user)
                }
            }
            completion(users, nil)
        }
    }
}
