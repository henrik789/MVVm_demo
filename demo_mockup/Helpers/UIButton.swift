import UIKit

extension UIButton {
    func commonStyle() {
        layer.cornerRadius = 20
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: layer.cornerRadius).cgPath
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 1, height: -3)
        layer.shadowRadius = 3.0
        layer.masksToBounds = false
    }
    
//    func animateButton1(button: UIButton, screenWidth: CGFloat, screenHeight: CGFloat){
//
//        UIButton.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 2, options: .curveEaseIn, animations: {
//            button.alpha = 1
//            button.backgroundColor = UIColor(named: "FarrowBall")
//            button.frame = CGRect(x: 10, y: 200, width: screenWidth / 2, height: screenHeight / 6)
//            button.layer.cornerRadius = 20
//            button.transform = CGAffineTransform(rotationAngle: CGFloat.pi * 2)
//
//        }) { _ in
//
//          }
//    }
//
//    func animateButton2(button: UIButton, screenWidth: CGFloat, screenHeight: CGFloat){
//
//        UIButton.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 2, options: .curveEaseIn, animations: {
//            button.alpha = 1
//            button.backgroundColor = UIColor(named: "FarrowBall")
//            button.frame = CGRect(x: 10, y: 200, width: screenWidth / 2, height: screenHeight / 6)
//            button.layer.cornerRadius = 20
//            button.transform = CGAffineTransform(rotationAngle: CGFloat.pi * 2)
//
//        }) { _ in
//
//
//        }
//    }
//
//    func animateButton3(button: UIButton, screenWidth: CGFloat, screenHeight: CGFloat){
//
//        UIButton.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 2, options: .curveEaseIn, animations: {
//            button.alpha = 1
//            button.backgroundColor = UIColor(named: "FarrowBall")
//            button.frame = CGRect(x: 10, y: 200, width: screenWidth / 2, height: screenHeight / 6)
//            button.layer.cornerRadius = 20
//            button.transform = CGAffineTransform(rotationAngle: CGFloat.pi * 2)
//
//        }) { _ in
//
//
//        }
//    }
    
}
