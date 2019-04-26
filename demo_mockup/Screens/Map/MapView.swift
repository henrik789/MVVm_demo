import MapKit
import UIKit

class MapView: UIView {
    
    static func instanceFromNib() -> MapView {
        return UINib(nibName: "MapView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! MapView
    }
    
    override init(frame: CGRect) {
        fatalError("init(coder:) has not been implemented")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // TODO: custom init
    }
}
