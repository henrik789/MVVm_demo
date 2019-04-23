
import UIKit

class HomeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var textLabel: UILabel!
    
    static var identifier: String {
        return "HomeCollectionViewCell"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
