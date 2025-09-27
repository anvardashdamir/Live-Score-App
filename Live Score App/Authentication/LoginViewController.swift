//
//  LoginViewController.swift
//  Live Score App
//
//  Created by Dashdemirli Enver on 24.09.25.
//

import UIKit

class LoginViewController: UIViewController {
        
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let logoLabel: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "logo")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.layer.cornerRadius = 10
        textField.layer.masksToBounds = true
        textField.backgroundColor = .white
        textField.font = UIFont.systemFont(ofSize: 16, weight: .light)
        textField.keyboardType = .emailAddress
        textField.returnKeyType = .done
        textField.autocapitalizationType = .none
        textField.setLeftPadding(10)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.layer.cornerRadius = 10
        textField.layer.masksToBounds = true
        textField.backgroundColor = .white
        textField.isSecureTextEntry = true
        textField.setLeftPadding(10)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
        
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = .dotColour
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Don't have an account? Register", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.setTitleColor(.dotColour, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupActions()
    }
    
    // MARK: - Setup
    private func setupUI() {
        view.backgroundColor = .customBackground
        
        view.addSubview(contentView)
        contentView.addSubview(logoLabel)
        contentView.addSubview(emailTextField)
        contentView.addSubview(passwordTextField)
        contentView.addSubview(loginButton)
        contentView.addSubview(registerButton)
        
        NSLayoutConstraint.activate([
            // Scroll View
            contentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            // Title
            logoLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            logoLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            // Email TextField
            emailTextField.topAnchor.constraint(equalTo: logoLabel.bottomAnchor, constant: 32),
            emailTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            emailTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            emailTextField.heightAnchor.constraint(equalToConstant: 40),
            
            // Password TextField
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 12),
            passwordTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            passwordTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            
            // Login Button
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 12),
            loginButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            loginButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            loginButton.heightAnchor.constraint(equalToConstant: 40),
            
            // Register Button
            registerButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 12),
            registerButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
//            registerButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40)
        ])
    }
    
    private func setupActions() {
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Actions
    @objc private func loginButtonTapped() {
        guard let email = emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines),
              let password = passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) else {
            return
        }
        
        // Validate input
        if email.isEmpty || password.isEmpty {
            showAlert(message: "Please fill in all fields")
            return
        }
        
        // Login user
        if UserManager.shared.login(email: email, password: password) {
            navigateToMainApp()
        } else {
            showAlert(message: "Invalid email or password")
        }
    }
    
    @objc private func registerButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Helper Methods
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
    private func navigateToMainApp() {
        // Navigate to main app (you'll need to implement this based on your app structure)
        if let sceneDelegate = view.window?.windowScene?.delegate as? SceneDelegate {
            sceneDelegate.showMainApp()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           // This line is what makes the keyboard dismiss.
           textField.resignFirstResponder()
           
           // You can also add your action code here, like performing a search or submitting a form.
           print("Return key tapped! Keyboard dismissed.")
           
           // The return value indicates if the system should process the return key press.
           // Returning `true` allows the default behavior to occur (if any).
           return true
       }
}
