
import UIKit

class HomeCollectionViewCell: UICollectionViewCell {

    static var identifier: String {
        return "HomeCollectionViewCell"
    }
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var imageCoverView: UIView!
    
//    var inspiration: Inspiration? {
//        didSet {
//            if let inspiration = inspiration {
//                titleLabel.text = inspiration.title
//                imageView.image = inspiration.backgroundImage
//            }
//        }
//    }
    
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
        
        // 1
        let standardHeight = UltravisualLayoutConstants.Cell.standardHeight
        let featuredHeight = UltravisualLayoutConstants.Cell.featuredHeight
        
        // 2
        let delta = 1 - (
            (featuredHeight - frame.height) / (featuredHeight - standardHeight)
        )
        
        // 3
        let minAlpha: CGFloat = 0.3
        let maxAlpha: CGFloat = 0.75
        imageCoverView.alpha = maxAlpha - (delta * (maxAlpha - minAlpha))
        let scale = max(delta, 0.5)
        titleLabel.transform = CGAffineTransform(scaleX: scale, y: scale)
        
    }
    
}


//class Inspiration: Session {
//    class func allInspirations() -> [Inspiration] {
//        var inspirations: [Inspiration] = []
//        guard let URL = Bundle.main.url(forResource: "Inspirations", withExtension: "plist"),
//            let tutorialsFromPlist = NSArray(contentsOf: URL) else {
//                return inspirations
//        }
//        for dictionary in tutorialsFromPlist {
//            let inspiration = Inspiration(dictionary: dictionary as! NSDictionary)
//            inspirations.append(inspiration)
//        }
//        return inspirations
//    }
//}
