import UIKit

private let badResponseError = NSError(domain: "Bad network response", code: 2, userInfo: nil)
// Handle all data
class  DataManager {
    
    let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func getUsers(completion: @escaping ([User], Error?) -> Void) {
        networkService.addRequest(.getUsers) { (data, response, error)  in
            guard let data = data , error == nil else {
                let error = error ?? badResponseError
                completion([], error)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let users = try decoder.decode([User].self, from: data)
                completion(users, nil)
            } catch {
                completion([], error)
            }
        }
    }
    
    func getImages(completion: @escaping (UIImage, Error?) -> Void) {
        networkService.addRequest(.getImages) { (data, response, error) in
            guard let data = data, error == nil else {
                let error = error ?? badResponseError
                completion(UIImage(), error)
                return
            }
            
            if let image = UIImage(data: data){
                completion(image, nil)
            }
          
        }
    }
    
}
