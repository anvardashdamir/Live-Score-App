//
//  Helper.swift
//  Live Score App
//
//  Created by Dashdemirli Enver on 13.09.25.
//

import UIKit

class Helper {
    
    func createNavigator(with title: String, and image: UIImage?, for viewController: UIViewController) -> UINavigationController {
        let navigator = UINavigationController(rootViewController: viewController)
        navigator.tabBarItem.title = title
        navigator.tabBarItem.image = image
        navigator.navigationBar.isHidden = true
        return navigator
    }
}

