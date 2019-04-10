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
            var allUsers: [User] = []
            var name: String = ""
            do{
                let newPerson = try JSONDecoder().decode([User].self, from: response as! Data)
                let userDictionary = newPerson 
//                let userDictionary = newPerson.reduce([:]) { (dictionary, user) -> [String: User] in
//                    var dictionary = dictionary
//                    dictionary[user.name] = user
//                    name = (dictionary[user.name]?.name)!
//
//                    print(name)
//                    return dictionary
//                }
                
                print("Count:  Name: \(newPerson)")
                completion(allUsers, nil)
            } catch{
                print(error)
            }
            
            // Parse the response
            // Call the completion
            
        }
    }
}


