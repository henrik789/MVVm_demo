
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
    var screenWidth = CGFloat()
    var screenHeight = CGFloat()
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
    @objc func config(){
        
        centerConstraint.constant = 0
        //        upperImage.transform = CGAffineTransform(rotationAngle: (90.0 * .pi) / 180.0)
        //        lowerImage.transform = CGAffineTransform(rotationAngle: (270.0 * .pi) / 180.0)
        let navbar = navigationController?.navigationBar
        navbar?.prefersLargeTitles = true
        navbar?.barStyle = .default
        navbar?.barTintColor = UIColor(named: "FarrowWhite")
        navbar?.tintColor = UIColor(named: "FarrowBall")
        navbar?.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "FarrowBall") as Any]
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(config))

        animateButton1(button: self.galleryButton, screenWidth: screenWidth, screenHeight: screenHeight)
    }
    
    func animateButton1(button: UIButton, screenWidth: CGFloat, screenHeight: CGFloat){
        
        UIButton.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 2, options: .curveEaseIn, animations: {
            button.alpha = 1
            button.backgroundColor = UIColor(named: "FarrowBall")
            button.frame = CGRect(x: 10, y: 150, width: screenWidth / 2, height: screenHeight / 6)
            button.layer.cornerRadius = 20
            button.transform = CGAffineTransform(rotationAngle: CGFloat.pi * 2)
            
        }) { _ in
            
            self.galleryButton.commonStyle()
            self.animateButton2(button: self.usersButton, screenWidth: screenWidth, screenHeight: screenHeight)
        }
    }
    
    func animateButton2(button: UIButton, screenWidth: CGFloat, screenHeight: CGFloat){
        
        UIButton.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 2, options: .curveEaseIn, animations: {
            button.alpha = 1
            button.backgroundColor = UIColor(named: "FarrowBall")
            button.frame = CGRect(x: 10, y: 250, width: screenWidth / 2, height: screenHeight / 6)
            button.layer.cornerRadius = 20
            button.transform = CGAffineTransform(rotationAngle: CGFloat.pi * 2)
            
        }) { _ in
            self.usersButton.commonStyle()
            self.animateButton3(button: self.imageButton, screenWidth: screenWidth, screenHeight: screenHeight)
        }
    }
    
    func animateButton3(button: UIButton, screenWidth: CGFloat, screenHeight: CGFloat){
        
        UIButton.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 2, options: .curveEaseIn, animations: {
            button.alpha = 1
            button.backgroundColor = UIColor(named: "FarrowBall")
            button.frame = CGRect(x: 10, y: 400, width: screenWidth / 2, height: screenHeight / 6)
            button.layer.cornerRadius = 20
            button.transform = CGAffineTransform(rotationAngle: CGFloat.pi * 2)
            
        }) { _ in
            
            self.imageButton.commonStyle()
//            self.animateButton3(button: self.imageButton, screenWidth: screenWidth, screenHeight: screenHeight)
        }
    }
    
}
