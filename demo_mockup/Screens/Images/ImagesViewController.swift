//

import UIKit

class ImagesViewController: UIViewController {
    
    let viewDemo = UIView()
    var screenWidth = CGFloat()
    var screenHeight = CGFloat()

    @IBOutlet weak var button1: PushButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        screenWidth = self.view.frame.size.width
        screenHeight = self.view.frame.size.height
        config()
    }
    
    func config(){
        button1.layer.shadowColor = UIColor.black.cgColor
        button1.layer.shadowOffset = CGSize(width: 1, height:3)
        button1.layer.shadowRadius = 3
        button1.layer.shadowOpacity = 0.6

        viewDemo.backgroundColor = UIColor.yellow
        viewDemo.frame = CGRect(x: (screenWidth / 2) - 30, y: (screenHeight / 2) - 30, width: 60, height: 60)
//        viewDemo.layer.cornerRadius = 30
        viewDemo.alpha = 1
        print(screenWidth, screenHeight)
    }
    
    @IBAction func imgeButton(_ sender: PushButton) {
        self.view.addSubview(viewDemo)
        UIView.animate(withDuration: 1.3, delay: 0, options: [.repeat, .autoreverse, .curveEaseInOut], animations: {
            self.viewDemo.alpha = 1
            self.viewDemo.backgroundColor = UIColor.red
            self.viewDemo.frame = CGRect(x: 0, y: 0, width: self.screenWidth, height: self
            .screenHeight)
        }, completion: nil)
    }
    
}

