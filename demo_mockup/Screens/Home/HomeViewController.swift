
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
    @IBOutlet weak var verticalConstraint: NSLayoutConstraint!
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
        self.centerConstraint.constant = 1
        self.verticalConstraint.constant = 60
        UIView.animate(withDuration: 0.33, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
            
        }) { _ in
            self.centerConstraint.constant = 0
            self.verticalConstraint.constant = 0
            self.view.layoutIfNeeded()
        }
    }
    
}

extension HomeViewController {
    @objc func config(){
        
        centerConstraint.constant = 0
        let navbar = navigationController?.navigationBar
        navbar?.prefersLargeTitles = true
        navbar?.barStyle = .default
        navbar?.barTintColor = UIColor(named: "FarrowWhite")
        navbar?.tintColor = UIColor(named: "FarrowBall")
        navbar?.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "FarrowBall") as Any]
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(showMap))
        galleryButton.commonStyle()
        usersButton.commonStyle()
        imageButton.commonStyle()
    }
    
    @objc func showMap() {
        let vc = MapViewController()
        self.present(vc, animated: true, completion: nil)
    }
    
}
