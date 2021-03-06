import UIKit

class ImageCollectionViewModel {
    let dataManager: DataManager
    private(set) var users: [User] = []
    //    private(set) var images: [Image] = []
    private(set) var image = UIImage()
    let title = "Gallery"
    
    init(dataManager: DataManager) {
        self.dataManager = dataManager
    }
    
    
    func updateImages(completion: @escaping (Error?) -> Void) {
        dataManager.getLargeImages { (image, error) in
            guard error == nil else {
                dispatchOnMain(completion, with: error)
                return
            }
            self.image = image
            dispatchOnMain(completion, with: error)
        }
    }
    
}



