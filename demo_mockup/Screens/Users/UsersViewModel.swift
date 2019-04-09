import Foundation

class UsersViewModel {
    let dataManager: DataManager
    private(set) var users: [User] = []
    
    init(dataManager: DataManager) {
        self.dataManager = dataManager
    }
    
    func updateUsers(completion: @escaping (Error?) -> Void) {
        dataManager.getUsers { (users, error) in
            guard error == nil else {
                completion(error)
                return
            }
            self.users = users
            completion(nil)
        }
    }
}
