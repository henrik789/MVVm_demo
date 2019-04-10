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
                let usersID = anItem["id"] as! Int
                let usersUserName = anItem["username"] as! String
                let industry = User(name: usersName, username: usersUserName, id: usersID)
                users.append(industry)
                print( "Name: \(usersName), Id: \(usersID), Username: \(usersUserName)" )
            }
                completion(users, nil)

        }
    }
}


