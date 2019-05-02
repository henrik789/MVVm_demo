//

import UIKit

class ImagesViewController: UIViewController {
    
    let viewDemo = UIView()

    @IBOutlet weak var button1: PushButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        config()
    }
    
    func config(){
        button1.layer.shadowColor = UIColor.black.cgColor
        button1.layer.shadowOffset = CGSize(width: 1, height:3)
        button1.layer.shadowRadius = 3
        button1.layer.shadowOpacity = 0.6

        viewDemo.backgroundColor = UIColor(displayP3Red: 0.8, green: 0.8, blue: 0.0, alpha: 0.1)
        viewDemo.frame = CGRect(x: (screenWidth / 2) - 5, y: (screenHeight / 2) - 5, width: 10, height: 10)
        viewDemo.alpha = 1
        navigationItem.title = "Images"
    }
    
    
    @IBAction func imgeButton(_ sender: PushButton) {
        self.view.addSubview(viewDemo)
        UIView.animate(withDuration: 1.3, delay: 0, options: [ .autoreverse, .curveEaseInOut], animations: {
            self.viewDemo.alpha = 1
            self.viewDemo.backgroundColor = UIColor(displayP3Red: 0.3, green: 0.1, blue: 0.8, alpha: 1)
            self.viewDemo.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
        },  completion: { (success:Bool) in
            self.viewDemo.removeFromSuperview()
            self.updateFocusIfNeeded()
        })
        
    }
    
}

