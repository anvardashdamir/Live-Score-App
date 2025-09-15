//
//  LiveNowSection.swift
//  Live Score App
//
//  Created by Dashdemirli Enver on 14.09.25.
//

import UIKit

class LiveNowSection: UIView {
    
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
    
    lazy var tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayout()
    }
    
    func setupLayout() {
        addSubview(liveNowLabel)
        addSubview(seeMoreLabel)
        seeMoreLabel.addGestureRecognizer(tapGesture)
        
        NSLayoutConstraint.activate([
            liveNowLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            liveNowLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            liveNowLabel.heightAnchor.constraint(equalToConstant: 20),
            liveNowLabel.widthAnchor.constraint(equalToConstant: 100),
            
            seeMoreLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            seeMoreLabel.centerYAnchor.constraint(equalTo: liveNowLabel.centerYAnchor),
            seeMoreLabel.heightAnchor.constraint(equalToConstant: 30),
            seeMoreLabel.widthAnchor.constraint(equalToConstant: 100),
        ])
    }
    
    @objc func handleTap() {
        print("see more label works")
    }
}
