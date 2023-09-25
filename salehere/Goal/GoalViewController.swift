//
//  GoalViewController.swift
//  salehere
//
//  Created by Anan Kaewsaart on 21/9/2566 BE.
//

import UIKit

class GoalViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    let goalCategory = "GoalCategoryTableViewCell"
    let goalDetails = "GoalDetailsTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        register()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.selectedIndex = 0
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        presentHomePage()
    }
    
    private func setupView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        self.tabBarItem = UITabBarItem(
            title: "",
            image: UIImage(named: "ic-home"),
            selectedImage: UIImage(named: "ic-home")
        )
    }
    
    private func register() {
        tableView.register(UINib(nibName: goalCategory, bundle: nil), forCellReuseIdentifier: goalCategory)
        tableView.register(UINib(nibName: goalDetails, bundle: nil), forCellReuseIdentifier: goalDetails)

    }
    
    private func presentHomePage() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let homeViewController = storyboard.instantiateViewController(withIdentifier: "HomaPageViewController") as? HomaPageViewController {
           
            if let tabBarController = self.tabBarController {
                if let viewControllers = tabBarController.viewControllers {
                    var newViewControllers = viewControllers
                    newViewControllers[0] = homeViewController
                    tabBarController.setViewControllers(newViewControllers, animated: false)
                    tabBarController.selectedIndex = 0
                }
            }
        }
    }
}

extension GoalViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: goalCategory, for: indexPath) as? GoalCategoryTableViewCell else {
                fatalError("Failed to dequeue GoalCategoryTableViewCell")
            }
            cell.selectionStyle = .none
    
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: goalDetails, for: indexPath) as? GoalDetailsTableViewCell else {
                fatalError("Failed to dequeue GoalDetailsTableViewCell")
            }
            cell.selectionStyle = .none
            
            return cell
        }

    }
}
