import Foundation

class UsersViewModel {
    let dataManager: DataManager
    private(set) var users: [User] = []
    let title = "Adressbook"
    
    init(dataManager: DataManager) {
        self.dataManager = dataManager
    }
    
    func updateUsers(completion: @escaping (Error?) -> Void) {
        dataManager.getUsers { (users, error) in
            guard error == nil else {
                dispatchOnMain(completion, with: error)
                return
            }
            self.users = users
            dispatchOnMain(completion, with: nil)
        }
    }
}


public func dispatchOnMain<T>(_ block: @escaping (T)->Void, with parameters: T) {
    DispatchQueue.main.async {
        block(parameters)
    }
}
