//
//  AccountViewController.swift
//  Live Score App
//
//  Created by Dashdemirli Enver on 13.09.25.
//

import UIKit

class AccountViewController: UIViewController {
    
    private let myAccount: UILabel = {
        let label = UILabel()
        label.text = "My Account"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let profilePhoto: UIImageView = {
        let image = UIImageView()
        image.image = .checkmark
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: 22/255, green: 22/255, blue: 22/255, alpha: 1)

    }

}
