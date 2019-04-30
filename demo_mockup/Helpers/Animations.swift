
import UIKit

extension UIView {
    
    func animatePopUp(view: UIView){
        addSubview(view)
        UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 2, options: .curveEaseIn, animations: {
            view.alpha = 1
            view.backgroundColor = UIColor(named: "FarrowBall")
            view.alpha = 0.3
            view.frame = CGRect(x: 30, y: 200, width: 300, height: 100)
            view.layer.cornerRadius = 20
            
        }) { _ in
            //            self.mapView.removeFromSuperview()
            
        }
    }
}
