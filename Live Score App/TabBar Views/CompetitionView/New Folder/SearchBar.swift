//
//  SearchBar.swift
//  Live Score App
//
//  Created by Dashdemirli Enver on 18.09.25.
//
import UIKit

// Needs to beautify

class SearchBar: UIView {
    
    let textField = UITextField()
    let searchIcon = UIImageView(image: UIImage(systemName: "magnifyingglass"))
    let placeholderText = "Search for competition, club..."
    let placeholderColor = UIColor(red: 182/255, green: 182/255, blue: 182/255, alpha: 1)
    
    override init(frame: CGRect) {
          super.init(frame: frame)
          setupUI()
      }
      
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    func setupUI() {
        let attributes = [NSAttributedString.Key.foregroundColor: placeholderColor]
        let attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: attributes)
        textField.attributedPlaceholder = attributedPlaceholder
        
        backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1)
        layer.cornerRadius = 10
        layer.masksToBounds = true
        
        searchIcon.tintColor = UIColor(red: 182/255, green: 182/255, blue: 182/255, alpha: 1)
        searchIcon.translatesAutoresizingMaskIntoConstraints = false
        
        textField.placeholder = "Search for competition, club..."
        

        textField.borderStyle = .none
        textField.textColor = .white
        textField.translatesAutoresizingMaskIntoConstraints = false

        addSubview(searchIcon)
        addSubview(textField)
        
        NSLayoutConstraint.activate([
            searchIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            searchIcon.centerYAnchor.constraint(equalTo: centerYAnchor),
            searchIcon.widthAnchor.constraint(equalToConstant: 20),
            searchIcon.heightAnchor.constraint(equalToConstant: 20),
            
            textField.leadingAnchor.constraint(equalTo: searchIcon.trailingAnchor, constant: 12),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            textField.centerYAnchor.constraint(equalTo: centerYAnchor),
            textField.heightAnchor.constraint(equalToConstant: 32)
        ])

    }
    
}
