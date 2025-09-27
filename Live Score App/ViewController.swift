//
//  ViewController.swift
//  Live Score App
//
//  Created by Dashdemirli Enver on 11.09.25.
//

/*

Live Score App
 Istifadeci istediyi oyunu favorite ede bilecek.
 Olkeler, liqalar ve klublar siyahisinda axtaris edile bilecek.
 Istifadecinin profile sehifesi olacaq, hemin sehifede deyisiklik ede bilecek.
*/


import UIKit


// this is my code
class ViewController: UITabBarController {
    
    var helper = Helper()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Check if user is still logged in
        if !UserManager.shared.isLoggedIn {
            if let sceneDelegate = view.window?.windowScene?.delegate as? SceneDelegate {
                sceneDelegate.showAuthenticationFlow()
            }
        }
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
            for: ProfileViewController()
        )

        self.viewControllers = [home, competition, favourite, account]
    }
}

