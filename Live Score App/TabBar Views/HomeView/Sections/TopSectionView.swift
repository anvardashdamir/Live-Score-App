//
//  TopSection.swift
//  Live Score App
//
//  Created by Dashdemirli Enver on 13.09.25.
//

import UIKit

class TopSectionView: UIView {
        
    private let topImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .logo
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let searchButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "magnifyingglass")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let notificationButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "bell"), for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()

    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayout()
    }
    
    private func setupLayout() {
        
        addSubview(topImageView)
        addSubview(searchButton)
        addSubview(notificationButton)
        
        NSLayoutConstraint.activate([
            topImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            topImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            topImageView.heightAnchor.constraint(equalToConstant: 40),
            topImageView.widthAnchor.constraint(equalToConstant: 120),
            
            notificationButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            notificationButton.centerYAnchor.constraint(equalTo: topImageView.centerYAnchor),
            notificationButton.heightAnchor.constraint(equalToConstant: 30),
            notificationButton.widthAnchor.constraint(equalToConstant: 30),
            
            searchButton.trailingAnchor.constraint(equalTo: notificationButton.leadingAnchor, constant: -15),
            searchButton.centerYAnchor.constraint(equalTo: topImageView.centerYAnchor),
            searchButton.heightAnchor.constraint(equalToConstant: 30),
            searchButton.widthAnchor.constraint(equalToConstant: 30)
        ])
    }
}
