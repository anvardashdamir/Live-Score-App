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
    
    private let liveNowLabel: UILabel = {
        let label = UILabel()
        label.text = "Live Now"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let seeMoreLabel: UILabel = {
        let label = UILabel()
        label.text = "see more"
        label.textColor = .dotColour
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = true
        return label
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
        addSubview(liveNowLabel)
        addSubview(seeMoreLabel)
        
        NSLayoutConstraint.activate([
            topImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            topImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            topImageView.heightAnchor.constraint(equalToConstant: 40),
            topImageView.widthAnchor.constraint(equalToConstant: 120),
            
            notificationButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            notificationButton.centerYAnchor.constraint(equalTo: topImageView.centerYAnchor),
            notificationButton.heightAnchor.constraint(equalToConstant: 30),
            notificationButton.widthAnchor.constraint(equalToConstant: 30),
            
            searchButton.trailingAnchor.constraint(equalTo: notificationButton.leadingAnchor, constant: -15),
            searchButton.centerYAnchor.constraint(equalTo: topImageView.centerYAnchor),
            searchButton.heightAnchor.constraint(equalToConstant: 30),
            searchButton.widthAnchor.constraint(equalToConstant: 30),
            
            liveNowLabel.topAnchor.constraint(equalTo: topImageView.bottomAnchor, constant: 6),
            liveNowLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            seeMoreLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            seeMoreLabel.centerYAnchor.constraint(equalTo: liveNowLabel.centerYAnchor),
        ])
    }
}

