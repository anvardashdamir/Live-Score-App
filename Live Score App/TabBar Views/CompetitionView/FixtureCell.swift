//
//  FixtureCell.swift
//  Live Score App
//
//  Created by Dashdemirli Enver on 22.09.25.
//

import UIKit

class FixtureCell: UICollectionViewCell {
    static let identifier = "FixtureCell"
    
    // MARK: - UI Elements
    private let homeLogo: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.widthAnchor.constraint(equalToConstant: 25).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 25).isActive = true
        return iv
    }()
    
    private let awayLogo: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.widthAnchor.constraint(equalToConstant: 25).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 25).isActive = true
        return iv
    }()
    
    private let homeTeam: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .white
        return label
    }()
    
    private let awayTeam: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .white
        return label
    }()
        
    private let date: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .gray
        return label
    }()
    
    private let time: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .gray
        return label
    }()

    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.layer.cornerRadius = 10
        contentView.clipsToBounds = true
        contentView.backgroundColor = .cellColour
        setupLayout()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    private func setupLayout() {
                
        let logosStack = UIStackView(arrangedSubviews: [homeLogo, awayLogo])
        logosStack.axis = .vertical
        logosStack.alignment = .center
        logosStack.spacing = 4

        let teamsStack = UIStackView(arrangedSubviews: [homeTeam, awayTeam])
        teamsStack.axis = .vertical
        teamsStack.spacing = 4
        
        
        let mainStack = UIStackView(arrangedSubviews: [date, logosStack, teamsStack, time])
        mainStack.axis = .horizontal
        mainStack.spacing = 12
        mainStack.alignment = .center
        mainStack.distribution = .fill
        
        contentView.addSubview(mainStack)
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        [date, homeLogo, awayLogo, homeTeam, awayTeam].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        logosStack.widthAnchor.constraint(equalToConstant: 30).isActive = true
        teamsStack.widthAnchor.constraint(greaterThanOrEqualToConstant: 200).isActive = true

        
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            mainStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            mainStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            mainStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
        ])
    }
}

extension FixtureCell {
    func configure(with fixture: Fixture) {
        homeTeam.text = fixture.homeTeam
        awayTeam.text = fixture.awayTeam
        homeLogo.image = UIImage(named: fixture.homeLogo)
        awayLogo.image = UIImage(named: fixture.awayLogo)
        
        date.text = fixture.date
        time.text = fixture.time
    }
}
