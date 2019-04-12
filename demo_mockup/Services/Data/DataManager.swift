import Foundation

// Handle all data
class  DataManager {
    
    let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func getUsers(completion: @escaping ([User], Error?) -> Void) {
        networkService.addRequest(.getUsers) { (response) in
            print("HTTP Response: \(response)")
            var users = [User]()
            for anItem in response as! [Dictionary<String, AnyObject>] {
                
                let usersName = anItem["name"] as! String
                let usersPhone = anItem["phone"] as! String
                let usersUserName = anItem["username"] as! String
                let usersEmail = anItem["email"] as! String
                let industry = User(name: usersName, username: usersUserName, phone: usersPhone, email: usersEmail)
                users.append(industry)
                print( "Name: \(usersName), Phone: \(usersPhone), Username: \(usersUserName), Email: \(usersEmail)" )
            }
                completion(users, nil)

        }
    }
}


