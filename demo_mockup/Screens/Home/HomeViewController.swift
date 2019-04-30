
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
    @IBOutlet weak var centerConstraint: NSLayoutConstraint!
    
    var snowView: SnowView!
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
    
    @IBAction func imageGalleryButton(_ sender: Any) {
        delegate?.homeViewController(self, didSelect: .imageGallery)
    }
    
    @IBAction func usersButtonAction(_ sender: Any) {
        delegate?.homeViewController(self, didSelect: .users)
    }
    
    @IBAction func imagesButtonAction(_ sender: Any) {
        delegate?.homeViewController(self, didSelect: .images)
    }

    @IBAction func animateButton(_ sender: Any) {
        self.centerConstraint.constant = 20
        UIView.animate(withDuration: 0.33, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 5, options: .curveLinear, animations: {
           self.view.layoutIfNeeded()
            
        }) { _ in
            self.centerConstraint.constant = 0
            self.view.layoutIfNeeded()
        }
    }
    
}

extension HomeViewController {
    func config(){
        
        snowView = SnowView(frame: CGRect(x: -150, y:-100, width: 300, height: 50))
        let snowClipView = UIView(frame: view.frame.offsetBy(dx: 0, dy: 50))
        snowClipView.clipsToBounds = true
        snowClipView.addSubview(snowView)
        view.addSubview(snowClipView)
        
        centerConstraint.constant = 0
        //        upperImage.transform = CGAffineTransform(rotationAngle: (90.0 * .pi) / 180.0)
        //        lowerImage.transform = CGAffineTransform(rotationAngle: (270.0 * .pi) / 180.0)
        let navbar = navigationController?.navigationBar
        navbar?.prefersLargeTitles = true
        navbar?.barStyle = .default
        navbar?.barTintColor = UIColor(named: "FarrowWhite")
        navbar?.tintColor = UIColor(named: "FarrowBall")
        navbar?.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "FarrowBall") as Any]
        
        galleryButton.commonStyle()
        usersButton.commonStyle()
        imageButton.commonStyle()
        
    }
}
