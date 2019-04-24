
import UIKit

protocol HomeViewControllerDelegate: class {
    func homeViewController(_ viewController: HomeViewController, didSelect action: HomeViewControllerAction)
}

enum HomeViewControllerAction {
    case users, images, imageGallery
}

class HomeViewController: UIViewController {
    @IBOutlet weak var imageButton: UIButton!
    @IBOutlet weak var galleryButton: UIButton!
    @IBOutlet weak var usersButton: UIButton!
    
    weak var delegate: HomeViewControllerDelegate?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        self.title = "Navigation"
        config()
    }
    
    func config(){
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.tintColor = .red
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.red]
        
        imageButton.layer.cornerRadius = 25
        galleryButton.layer.cornerRadius = 25
        usersButton.layer.cornerRadius = 25
    }
    @IBAction func imageGalleryButton(_ sender: Any) {
        delegate?.homeViewController(self, didSelect: .imageGallery)
    }
    
    @IBAction func usersButtonAction(_ sender: Any) {
        delegate?.homeViewController(self, didSelect: .users)
    }
    
    @IBAction func imagesButtonAction(_ sender: Any) {
        delegate?.homeViewController(self, didSelect: .images)
    }
}

