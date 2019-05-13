
import UIKit

class GalleryCollectionViewCell: UICollectionViewCell {

    static var identifier: String {
        return "GalleryCollectionViewCell"
    }
    
    
    @IBOutlet weak var imageCoverView: UIView!
    @IBOutlet weak var fxBlur: UIVisualEffectView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    
    
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
        
        let standardHeight = UltravisualLayoutConstants.Cell.standardHeight
        let featuredHeight = UltravisualLayoutConstants.Cell.featuredHeight
        let delta = 1 - (
            (featuredHeight - frame.height) / (featuredHeight - standardHeight)
        )
        let minAlpha: CGFloat = 0.01
        let maxAlpha: CGFloat = 0.7
        imageCoverView.alpha = maxAlpha - (delta * (maxAlpha - minAlpha))
        fxBlur.alpha = maxAlpha - (delta * (maxAlpha - minAlpha))
        let scale = max(delta, 0.7)
        textLabel.transform = CGAffineTransform(scaleX: scale, y: scale)
        
    }

}
