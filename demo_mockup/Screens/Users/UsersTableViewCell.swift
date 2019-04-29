
import UIKit

class UsersTableViewCell: UITableViewCell {

    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var mainImage: UIImageView!

    static var identifier: String {
        return "UsersTableViewCell"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config(){
        
        mainImage.layer.shadowColor = UIColor.black.cgColor
        mainImage.layer.shadowOpacity = 0.6
        mainImage.layer.shadowOffset = CGSize(width: 2, height: 3)
        let size = CGSize(width: 60, height: 60)
        let rect = CGRect(origin: .zero, size: size)
        mainImage.layer.shadowRadius = 3
        mainImage.layer.shadowPath = UIBezierPath(roundedRect: rect, cornerRadius: 15).cgPath
        mainImage.clipsToBounds = false
        
//        nameLabel.layer.shadowColor = UIColor.yellow.cgColor
//        nameLabel.layer.shadowOpacity = 1
//        nameLabel.layer.shadowRadius = 3
//        nameLabel.layer.shadowOffset = CGSize(width: 1, height: 2)
    }
    
}
