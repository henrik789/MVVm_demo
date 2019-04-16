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
    }

}


extension UsersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UsersTableViewCell.identifier, for: indexPath) as! UsersTableViewCell

        let user = viewModel.users[indexPath.row]
        cell.nameLabel.text = user.name
        cell.idLabel.text = user.username
        cell.emailLabel.text = user.email
        cell.phoneLabel.text = user.phone
        return cell
    }
    
}

extension UsersViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        tableView.scrollToRow(at: indexPath, at: .top, animated: true)
    }
    
}
