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
            // json is an array
            for anItem in response as! [Dictionary<String, AnyObject>] {
                let usersName = anItem["name"] as! String
                let usersID = anItem["id"] as! Int
                let usersUserName = anItem["username"] as! String
                let industry = User(name: usersName, username: usersUserName, id: usersID)
                users.append(industry)
                print( "Name: \(usersName), Id: \(usersID), Username: \(usersUserName)" )
            }

//            var allUsers: [User] = []
//            var name: String = ""
//            do{
//                let newPerson = try JSONDecoder().decode([User].self, from: response as! Data)
//                let userDictionary = newPerson
//                let userDictionary = newPerson.reduce([:]) { (dictionary, user) -> [String: User] in
//                    var dictionary = dictionary
//                    dictionary[user.name] = user
//                    name = (dictionary[user.name]?.name)!
//
//                    print(name)
//                    return dictionary
//                }
//                print("Count:  Name: \(newPerson)")
                completion(users, nil)
            
            // Parse the response
            // Call the completion
            
        }
    }
}


