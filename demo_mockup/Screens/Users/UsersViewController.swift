import UIKit
import Kingfisher

private let cellIdentifier = "BasicCell"

class UsersViewController: UIViewController {
    
    let viewModel: UsersViewModel
    
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
        
        let url = URL(string: "https://picsum.photos/id/\(indexPath.row + 2)/90/90")
        cell.mainImage.kf.indicatorType = .activity
        cell.mainImage.kf.setImage(with: url)

//        let processor = DownsamplingImageProcessor(size: cell.mainImage.size)
//            >> RoundCornerImageProcessor(cornerRadius: 20)
//        cell.mainImage.kf.setImage(
//            with: url,
//            placeholder: UIImage(named: "placeholderImage"),
//            options: [
//                .processor(processor),
//                .scaleFactor(UIScreen.main.scale),
//                .transition(.fade(1)),
//                .cacheOriginalImage
//            ])
//        {
//            result in
//            switch result {
//            case .success(let value):
//                print("Task done for: \(value.source.url?.absoluteString ?? "")")
//            case .failure(let error):
//                print("Job failed: \(error.localizedDescription)")
//            }
//        }
        
        return cell
    }
    
}

extension UsersViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
