
import UIKit

class MainNavigationController: UINavigationController {
     let serviceManager = ServiceManager()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setRootViewController()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension MainNavigationController {
    func setRootViewController() {
        let homeViewController = HomeViewController()
        homeViewController.delegate = self
        viewControllers = [homeViewController]
    }
}


extension MainNavigationController: HomeViewControllerDelegate {
    func homeViewController(_ viewController: HomeViewController, didSelect action: HomeViewControllerAction) {
        
        let viewController: UIViewController
        
        switch action {
        case .images:
            viewController = UIViewController()
            viewController.view.backgroundColor = .red
            
        case .users:
            let userViewModel = UsersViewModel(dataManager: serviceManager.dataManager)
            viewController = UsersViewController(viewModel: userViewModel)
        }
        
        pushViewController(viewController, animated: true)
    }
}

