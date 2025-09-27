//
//  RegisterViewController.swift
//  Live Score App
//
//  Created by Dashdemirli Enver on 24.09.25.
//

import UIKit

class RegisterViewController: UIViewController {
        
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

    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Name"
        textField.layer.cornerRadius = 10
        textField.layer.masksToBounds = true
        textField.backgroundColor = .white
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.setLeftPadding(10)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.layer.cornerRadius = 10
        textField.layer.masksToBounds = true
        textField.backgroundColor = .white
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.keyboardType = .emailAddress
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
        
    private let registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Register", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = .dotColour
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Already have an account? Login", for: .normal)
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
        contentView.addSubview(nameTextField)
        contentView.addSubview(emailTextField)
        contentView.addSubview(passwordTextField)
        contentView.addSubview(registerButton)
        contentView.addSubview(loginButton)
        
        NSLayoutConstraint.activate([
            // Scroll View
            contentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            // Title
            logoLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            logoLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),

            // Name TextField
            nameTextField.topAnchor.constraint(equalTo: logoLabel.bottomAnchor, constant: 32),
            nameTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            nameTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            nameTextField.heightAnchor.constraint(equalToConstant: 40),
            
            // Email TextField
            emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 12),
            emailTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            emailTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            emailTextField.heightAnchor.constraint(equalToConstant: 40),
            
            // Password TextField
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 12),
            passwordTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            passwordTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            
            // Register Button
            registerButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 22),
            registerButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            registerButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            registerButton.heightAnchor.constraint(equalToConstant: 40),
            
            // Login Button
            loginButton.topAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: 12),
            loginButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        ])
    }
    
    private func setupActions() {
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Actions
    @objc private func registerButtonTapped() {
        guard let name = nameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines),
              let email = emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines),
              let password = passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) else {
            return
        }
        
        // Validate input
        if name.isEmpty || email.isEmpty || password.isEmpty {
            showAlert(message: "Please fill in all fields")
            return
        }
        
        if !isValidEmail(email) {
            showAlert(message: "Please enter a valid email address")
            return
        }
        
        if password.count < 6 {
            showAlert(message: "Password must be at least 6 characters long")
            return
        }
        
        // Register user
        let user = User(name: name, email: email, password: password)
        
        if UserManager.shared.register(user: user) {
            navigateToMainApp()
        } else {
            showAlert(message: "An account with this email already exists")
        }
    }
    
    @objc private func loginButtonTapped() {
        let loginVC = LoginViewController()
        navigationController?.pushViewController(loginVC, animated: true)
    }
    
    // MARK: - Helper Methods
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
    private func navigateToMainApp() {
        if let sceneDelegate = view.window?.windowScene?.delegate as? SceneDelegate {
            sceneDelegate.showMainApp()
        }
    }
}

extension UITextField {
    func setLeftPadding(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}
