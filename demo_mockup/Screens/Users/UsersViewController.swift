import UIKit
import Kingfisher

private let cellIdentifier = "BasicCell"

class UsersViewController: UIViewController {
    
    let viewModel: UsersViewModel
    var mapView: UIView = UIView()

    @IBOutlet weak var tableView: UITableView!
    
    init(viewModel: UsersViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initConfig()
    }
    
    func initConfig() {
        self.title = viewModel.title
        tableView.register(UINib.init(nibName: UsersTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: UsersTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        loadData()
        mapView = UIView(frame: CGRect(x: 30, y: screenHeight / 3, width: screenWidth / 3, height: screenHeight / 3))
        mapView.backgroundColor = UIColor(named: "FarrowBall")
        mapView.layer.cornerRadius = 20

    }
    
    func loadData() {
        viewModel.updateUsers { (error) in
            self.tableView.reloadData()
        }
        viewModel.updateImages { (error) in
            self.tableView.reloadData()
        }
    }

}


extension UsersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UsersTableViewCell.identifier, for: indexPath) as! UsersTableViewCell
        cell.config()
        
        let user = viewModel.users[indexPath.row]
        
        cell.nameLabel.text = user.name
        cell.idLabel.text = user.username
        cell.emailLabel.text = user.email
        cell.phoneLabel.text = user.phone
        let randomNumber = Int.random(in: 33..<199)
        let url = URL(string: "https://picsum.photos/id/\(indexPath.row + randomNumber)/90/90")
        cell.mainImage.kf.indicatorType = .activity
        let processor = RoundCornerImageProcessor(cornerRadius: 15)
        cell.mainImage.kf.setImage(with: url, options: [.processor(processor)])
        
        return cell
    }
    
}

extension UsersViewController: UITableViewDelegate {
    


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
//        let vc = MapViewController()
//        self.present(vc, animated: true, completion: nil)
//        self.view = MapView.instanceFromNib()
//        let subview = MapView.instanceFromNib()
        self.view.animatePopUp(view: mapView, screenWidth: screenWidth, screenHeight: screenHeight)
        
    }
    

}

