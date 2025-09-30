//
//  AccountViewController.swift
//  Live Score App
//
//  Created by Dashdemirli Enver on 13.09.25.
//

import UIKit

class ProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let myAccountLabel: UILabel = {
        let label = UILabel()
        label.text = "My Account"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person.circle.fill")
        imageView.tintColor = .systemBlue
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 50
        imageView.layer.masksToBounds = true
        imageView.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .lightGray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let infoContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .cellColour
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let logoutButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Logout", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = .systemRed
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupActions()
        loadUserData()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(changeProfileImage))
        profileImageView.addGestureRecognizer(tapGesture)
    }
    
    @objc private func changeProfileImage() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        present(picker, animated: true)
    }
    
    // MARK: - UIImagePickerControllerDelegate
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editedImage = info[.editedImage] as? UIImage {
            profileImageView.image = editedImage
            saveProfileImage(editedImage)
        } else if let originalImage = info[.originalImage] as? UIImage {
            profileImageView.image = originalImage
            saveProfileImage(originalImage)
        }
        picker.dismiss(animated: true)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    
    private func saveProfileImage(_ image: UIImage) {
        if let data = image.jpegData(compressionQuality: 0.8) {
            UserDefaults.standard.set(data, forKey: "profileImage")
        }
    }

    private func loadUserData() {
        if let user = UserManager.shared.currentUser {
            nameLabel.text = user.name
            emailLabel.text = user.email
        }
        
        if let data = UserDefaults.standard.data(forKey: "profileImage"),
           let savedImage = UIImage(data: data) {
            profileImageView.image = savedImage
        }
    }
    
    // MARK: - Setup
    private func setupUI() {
        view.backgroundColor = .customBackground
        title = "Profile"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.addSubview(contentView)
        
        contentView.addSubview(myAccountLabel)
        contentView.addSubview(profileImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(emailLabel)
        contentView.addSubview(infoContainerView)
        contentView.addSubview(logoutButton)
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            myAccountLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            myAccountLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            profileImageView.topAnchor.constraint(equalTo: myAccountLabel.bottomAnchor, constant: 10),
            profileImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: 100),
            profileImageView.heightAnchor.constraint(equalToConstant: 100),
            
            nameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 12),
            nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 12),
            emailLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            infoContainerView.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 12),
            infoContainerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            infoContainerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            infoContainerView.heightAnchor.constraint(equalToConstant: 120),
            
            logoutButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            logoutButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            logoutButton.heightAnchor.constraint(equalToConstant: 40),
            logoutButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
        
        let memberSinceLabel = UILabel()
        memberSinceLabel.text = "Member Since"
        memberSinceLabel.font = UIFont.systemFont(ofSize: 14)
        memberSinceLabel.textColor = .lightGray
        memberSinceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let dateLabel = UILabel()
        dateLabel.text = DateFormatter.localizedString(from: Date(), dateStyle: .medium, timeStyle: .none)
        dateLabel.font = UIFont.boldSystemFont(ofSize: 16)
        dateLabel.textColor = .white
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let appVersionLabel = UILabel()
        appVersionLabel.text = "App Version"
        appVersionLabel.font = UIFont.systemFont(ofSize: 14)
        appVersionLabel.textColor = .lightGray
        appVersionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let versionLabel = UILabel()
        versionLabel.text = "1.0.0"
        versionLabel.font = UIFont.boldSystemFont(ofSize: 16)
        versionLabel.textColor = .white
        versionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        infoContainerView.addSubview(memberSinceLabel)
        infoContainerView.addSubview(dateLabel)
        infoContainerView.addSubview(appVersionLabel)
        infoContainerView.addSubview(versionLabel)
        
        NSLayoutConstraint.activate([
            memberSinceLabel.topAnchor.constraint(equalTo: infoContainerView.topAnchor, constant: 16),
            memberSinceLabel.leadingAnchor.constraint(equalTo: infoContainerView.leadingAnchor, constant: 16),
            
            dateLabel.topAnchor.constraint(equalTo: memberSinceLabel.bottomAnchor, constant: 4),
            dateLabel.leadingAnchor.constraint(equalTo: infoContainerView.leadingAnchor, constant: 16),
            
            appVersionLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 16),
            appVersionLabel.leadingAnchor.constraint(equalTo: infoContainerView.leadingAnchor, constant: 16),
            
            versionLabel.topAnchor.constraint(equalTo: appVersionLabel.bottomAnchor, constant: 4),
            versionLabel.leadingAnchor.constraint(equalTo: infoContainerView.leadingAnchor, constant: 16),
        ])
    }
    
    private func setupActions() {
        logoutButton.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
    }
        
    // MARK: - Actions
    @objc private func logoutButtonTapped() {
        let alert = UIAlertController(
            title: "Logout",
            message: "Are you sure you want to logout?",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        alert.addAction(UIAlertAction(title: "Logout", style: .destructive) { _ in
            self.performLogout()
        })
        
        present(alert, animated: true)
    }
    
    private func performLogout() {
        UserManager.shared.logout()
        
        if let sceneDelegate = view.window?.windowScene?.delegate as? SceneDelegate {
            sceneDelegate.showAuthenticationFlow()
        }
    }
}


