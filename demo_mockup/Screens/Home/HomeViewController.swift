
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
    
//        upperImage.transform = CGAffineTransform(rotationAngle: (90.0 * .pi) / 180.0)
//        lowerImage.transform = CGAffineTransform(rotationAngle: (270.0 * .pi) / 180.0)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.tintColor = .red
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.red]
        
        galleryButton.layer.cornerRadius = 25
        galleryButton.layer.cornerRadius = 25
        galleryButton.layer.shadowPath =
            UIBezierPath(roundedRect: galleryButton.bounds,
                         cornerRadius: galleryButton.layer.cornerRadius).cgPath
        galleryButton.layer.shadowColor = UIColor.black.cgColor
        galleryButton.layer.shadowOpacity = 0.5
        galleryButton.layer.shadowOffset = CGSize(width: 1, height: -3)
        galleryButton.layer.shadowRadius = 3.0
        galleryButton.layer.masksToBounds = false
        
        usersButton.layer.cornerRadius = 25
        usersButton.layer.cornerRadius = 25
        usersButton.layer.shadowPath =
            UIBezierPath(roundedRect: usersButton.bounds,
                         cornerRadius: usersButton.layer.cornerRadius).cgPath
        usersButton.layer.shadowColor = UIColor.black.cgColor
        usersButton.layer.shadowOpacity = 0.5
        usersButton.layer.shadowOffset = CGSize(width: 1, height: -3)
        usersButton.layer.shadowRadius = 3.0
        usersButton.layer.masksToBounds = false
        
        imageButton.layer.cornerRadius = 25
        imageButton.layer.shadowPath =
            UIBezierPath(roundedRect: imageButton.bounds,
                         cornerRadius: imageButton.layer.cornerRadius).cgPath
        imageButton.layer.shadowColor = UIColor.black.cgColor
        imageButton.layer.shadowOpacity = 0.5
        imageButton.layer.shadowOffset = CGSize(width: 1, height: -3)
        imageButton.layer.shadowRadius = 3.0
        imageButton.layer.masksToBounds = false
        
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
    
//    private var shadowLayer: CAShapeLayer!
//    private var cornerRadius: CGFloat = 25.0
//    private var fillColor: UIColor = .blue // the color applied to the shadowLayer, rather than the view's backgroundColor
    
}


