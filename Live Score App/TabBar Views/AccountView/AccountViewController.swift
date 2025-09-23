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
        label.layer.cornerRadius = 10
        return label
    }()
    
    private let profilePhoto: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "person.fill")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Enver Dashdemirli"
        return label
    }()
    
    private let logoutButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log Out", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .dotColour
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        logoutButton.addTarget(self, action: #selector(logoutTapped), for: .touchUpInside)
    }
    
    func setupUI() {
        view.addSubview(myAccount)
        view.addSubview(profilePhoto)
        view.addSubview(nameLabel)
        view.addSubview(logoutButton)
        
        view.backgroundColor = UIColor(red: 22/255, green: 22/255, blue: 22/255, alpha: 1)
        
        NSLayoutConstraint.activate([
            myAccount.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            myAccount.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            profilePhoto.topAnchor.constraint(equalTo: myAccount.bottomAnchor, constant: 40),
            profilePhoto.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profilePhoto.heightAnchor.constraint(equalToConstant: 80),
            profilePhoto.widthAnchor.constraint(equalToConstant: 80),
            
            nameLabel.topAnchor.constraint(equalTo: profilePhoto.bottomAnchor, constant: 12),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            logoutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            logoutButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            logoutButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16),
            logoutButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
    }
    
    @objc private func logoutTapped() {
        let alert = UIAlertController(title: "Logged Out", message: "You have been logged out.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}

