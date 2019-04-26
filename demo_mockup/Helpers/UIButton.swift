import UIKit

extension UIButton {
    func commonStyle() {
        layer.cornerRadius = 25
        layer.cornerRadius = 25
        layer.shadowPath =
            UIBezierPath(roundedRect: bounds,
                         cornerRadius: layer.cornerRadius).cgPath
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 1, height: -3)
        layer.shadowRadius = 3.0
        layer.masksToBounds = false
    }
}
