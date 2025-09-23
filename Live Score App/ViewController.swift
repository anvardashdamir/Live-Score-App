//
//  ViewController.swift
//  Live Score App
//
//  Created by Dashdemirli Enver on 11.09.25.
//

// Live Now label
// main collection view
// main collection view headerine verilecek sol sağ scroll cell
// main collection view normal celllerinde olacaq label ve table

import UIKit

class ViewController: UITabBarController {
    
    var helper = Helper()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
    }
    
    func setupViewControllers() {
        
        self.selectedIndex = 0
        self.tabBar.isTranslucent = false
        self.tabBar.tintColor = UIColor(red: 227/255, green: 78/255, blue: 106/255, alpha: 1)
        self.tabBar.unselectedItemTintColor = UIColor(red: 104/255, green: 112/255, blue: 131/255, alpha: 1)
        self.tabBar.backgroundColor = UIColor(red: 22/255, green: 22/255, blue: 22/255, alpha: 1)
        
        let home = helper.createNavigator(
            with: "Home",
            and: UIImage(systemName: "house"),
            for: HomeViewController()
        )
        
        let competition = helper.createNavigator(
            with: "Competition",
            and: UIImage(systemName: "list.star"),
            for: CompetitionViewController()
        )
        
        let favourite = helper.createNavigator(
            with: "Favourite",
            and: UIImage(systemName: "star"),
            for: FavouriteViewController()
        )
        
        let account = helper.createNavigator(
            with: "Account",
            and: UIImage(systemName: "person"),
            for: AccountViewController()
        )

        self.viewControllers = [home, competition, favourite, account]
    }



}


