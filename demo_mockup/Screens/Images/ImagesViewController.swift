//

import UIKit

class ImagesViewController: UIViewController {
    
    
    
    let viewDemo = UIView()
    
    @IBAction func imgeButton(_ sender: Any) {
        self.view.addSubview(viewDemo)
        UIView.animate(withDuration: 1.0, delay: 0, options: [.repeat, .autoreverse, .transitionFlipFromBottom, .curveEaseInOut], animations: {
            self.viewDemo.alpha = 0
            self.viewDemo.frame = CGRect(x: 50, y: 350, width: 120, height: 120)
        }, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        config()
    }
    
    func config(){
        let screenWidth = self.view.frame.size.width
        let screenHeight = self.view.frame.size.height
        viewDemo.backgroundColor = UIColor.yellow
        viewDemo.frame = CGRect(x: screenWidth / 2, y: screenHeight / 2, width: 100, height: 100)
        viewDemo.layer.cornerRadius = 50
        viewDemo.alpha = 1
        print(screenWidth, screenHeight)
    }

}

