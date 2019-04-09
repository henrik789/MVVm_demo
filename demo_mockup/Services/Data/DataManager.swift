import Foundation

// Handle all data
class  DataManager {
    
    let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func getUsers(completion: @escaping ([User], Error?) -> Void) {
        networkService.addRequest(.getUsers) { (response) in
                
            
            
            // Parse the response
            // Call the completion
            completion(User.mockUsers, nil)
        }
    }
    
}


