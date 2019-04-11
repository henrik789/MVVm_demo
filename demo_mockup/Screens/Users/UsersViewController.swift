import UIKit

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
        self.title = "Adressbook"
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
    }

}


extension UsersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UsersTableViewCell.identifier, for: indexPath) as! UsersTableViewCell
        
//        let cellData = viewModel.users[indexPath.row]
//        cell.setContent(user: cellData)
//        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.nameLabel.text = viewModel.users[indexPath.row].name
        cell.idLabel.text = viewModel.users[indexPath.row].username
        cell.emailLabel.text = viewModel.users[indexPath.row].email
        cell.phoneLabel.text = viewModel.users[indexPath.row].phone
//        print(viewModel.users[indexPath.row].username)
        return cell
    }
    
}

extension UsersViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
