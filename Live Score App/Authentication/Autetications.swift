//
//  Autetications.swift
//  Live Score App
//
//  Created by Dashdemirli Enver on 24.09.25.
//

import UIKit

// MARK: - User Model
struct User {
    let name: String
    let email: String
    let password: String
    
    // Convert to dictionary for storage
    func toDictionary() -> [String: Any] {
        return [
            "name": name,
            "email": email,
            "password": password
        ]
    }
    
    // Create user from dictionary
    init?(from dictionary: [String: Any]) {
        guard let name = dictionary["name"] as? String,
              let email = dictionary["email"] as? String,
              let password = dictionary["password"] as? String else {
            return nil
        }
        
        self.name = name
        self.email = email
        self.password = password
    }
    
    init(name: String, email: String, password: String) {
        self.name = name
        self.email = email
        self.password = password
    }
}

// MARK: - User Manager (Handles authentication and persistence)
class UserManager {
    static let shared = UserManager()
    
    private let userDefaults = UserDefaults.standard
    private let isLoggedInKey = "isLoggedIn"
    private let currentUserKey = "currentUser"
    private let usersKey = "registeredUsers"
    
    private init() {}
    
    // MARK: - Authentication State
    var isLoggedIn: Bool {
        return userDefaults.bool(forKey: isLoggedInKey)
    }
    
    var currentUser: User? {
        guard let userData = userDefaults.dictionary(forKey: currentUserKey) else { return nil }
        return User(from: userData)
    }
    
    // MARK: - Registration
    func register(user: User) -> Bool {
        // Check if user already exists
        if isUserRegistered(email: user.email) {
            return false
        }
        
        // Get existing users
        var users = getRegisteredUsers()
        users.append(user)
        
        // Save users
        let usersData = users.map { $0.toDictionary() }
        userDefaults.set(usersData, forKey: usersKey)
        
        // Auto login after registration
        login(user: user)
        
        return true
    }
    
    // MARK: - Login
    func login(email: String, password: String) -> Bool {
        let users = getRegisteredUsers()
        
        if let user = users.first(where: { $0.email == email && $0.password == password }) {
            login(user: user)
            return true
        }
        
        return false
    }
    
    private func login(user: User) {
        userDefaults.set(true, forKey: isLoggedInKey)
        userDefaults.set(user.toDictionary(), forKey: currentUserKey)
    }
    
    // MARK: - Logout
    func logout() {
        userDefaults.set(false, forKey: isLoggedInKey)
        userDefaults.removeObject(forKey: currentUserKey)
    }
    
    // MARK: - Helper Methods
    private func isUserRegistered(email: String) -> Bool {
        let users = getRegisteredUsers()
        return users.contains { $0.email == email }
    }
    
    private func getRegisteredUsers() -> [User] {
        guard let usersData = userDefaults.array(forKey: usersKey) as? [[String: Any]] else {
            return []
        }
        
        return usersData.compactMap { User(from: $0) }
    }
}

// MARK: - Scene Delegate Extension
extension SceneDelegate {
    
    func showMainApp() {
        let mainVC = ViewController()
        window?.rootViewController = mainVC
        window?.makeKeyAndVisible()
        
//        let navController = UINavigationController(rootViewController: mainVC)
//        navController.navigationBar.barStyle = .black
//        navController.navigationBar.tintColor = .white
//        
//        window?.rootViewController = navController
//        window?.makeKeyAndVisible()
    

    }
    
    func showAuthenticationFlow() {
        let registerVC = RegisterViewController()
        let navController = UINavigationController(rootViewController: registerVC)
        navController.navigationBar.barStyle = .black
        navController.navigationBar.tintColor = .white
        
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
    }
    
    func checkAuthenticationState() {
        if UserManager.shared.isLoggedIn {
            showMainApp()
        } else {
            showAuthenticationFlow()
        }
    }
}


        
