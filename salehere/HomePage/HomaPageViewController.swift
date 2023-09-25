//
//  HomaPageViewController.swift
//  salehere
//
//  Created by Anan Kaewsaart on 20/9/2566 BE.
//

import UIKit

class HomaPageViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    let contentHome = "ContentHomePageTableViewCell"
    let headerHome = "HeaderHomePageTableViewCell"
    var viewModel: HomaPageViewModelProtocol = HomaPageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        register()
        setupView()
        viewModel.input.getSocket()
        tabBarController?.selectedIndex = 0
    }
    
    private func setupView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        self.tabBarItem = UITabBarItem(
            title: "",
            image: UIImage(named: "ic-home"),
            selectedImage: UIImage(named: "ic-home")
        )
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let statusBarManager = windowScene.statusBarManager {
            let statusBarFrame = statusBarManager.statusBarFrame
            let padding = 5.0
            let statusBarHeight = statusBarFrame.height + padding

            tableView.contentInset = UIEdgeInsets(top: -statusBarHeight, left: 0, bottom: 0, right: 0)
        }
        
        viewModel.input.didGetSocket = { [weak self] badge in
            self?.tabBarController?.tabBar.items?[0].badgeValue = badge
        }
    }
    
    private func register() {
        tableView.register(UINib(nibName: headerHome, bundle: nil), forCellReuseIdentifier: headerHome)
        tableView.register(UINib(nibName: contentHome, bundle: nil), forCellReuseIdentifier: contentHome)

    }
    
    private func presentNewGoalPage() {
        let goalViewController = GoalViewController()
        
        if let tabBarController = self.tabBarController {
            if let viewControllers = tabBarController.viewControllers {
                var newViewControllers = viewControllers
                newViewControllers[0] = goalViewController
                tabBarController.setViewControllers(newViewControllers, animated: false)
                tabBarController.selectedIndex = 0
            }
        }
    }

}

extension HomaPageViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return 4
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: headerHome, for: indexPath) as? HeaderHomePageTableViewCell else {
                fatalError("Failed to dequeue HeaderHomePageTableViewCell")
            }
            cell.selectionStyle = .none
            cell.clickGoalButton  = { [weak self] in
                self?.presentNewGoalPage()
            }
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: contentHome, for: indexPath) as? ContentHomePageTableViewCell else {
                fatalError("Failed to dequeue ContentHomePageTableViewCell")
            }
            cell.selectionStyle = .none
            return cell
        }

    }
}
