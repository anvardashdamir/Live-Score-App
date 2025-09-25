//
//  ResultsCell.swift
//  Live Score App
//
//  Created by Dashdemirli Enver on 22.09.25.
//

import UIKit

class ResultsCell: UICollectionViewCell {
    static let identifier = "ResultsCell"
        
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
    
    private let homeTeamLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .white
        return label
    }()
    
    private let awayTeamLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .white
        return label
    }()
    
    private let homeScore: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let awayScore: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .gray
        return label
    }()
    
    private let isLive: UILabel = {
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
        super.init(coder: coder)
        contentView.layer.cornerRadius = 10
        contentView.clipsToBounds = true
        contentView.backgroundColor = .cellColour
        setupLayout()
    }
    
    // MARK: - Layout
    private func setupLayout() {
                
        let timeStack = UIStackView(arrangedSubviews: [isLive, dateLabel])
        timeStack.axis = .vertical
        timeStack.alignment = .center
        timeStack.spacing = 4
        
        let logosStack = UIStackView(arrangedSubviews: [homeLogo, awayLogo])
        logosStack.axis = .vertical
        logosStack.alignment = .center
        logosStack.spacing = 4

        let teamsStack = UIStackView(arrangedSubviews: [homeTeamLabel, awayTeamLabel])
        teamsStack.axis = .vertical
        teamsStack.spacing = 4
        
        let scoreStack = UIStackView(arrangedSubviews: [homeScore, awayScore])
        scoreStack.axis = .vertical
        scoreStack.alignment = .center
        scoreStack.spacing = 4
        
        let mainStack = UIStackView(arrangedSubviews: [timeStack, logosStack, teamsStack, scoreStack])
        mainStack.axis = .horizontal
        mainStack.spacing = 12
        mainStack.alignment = .center
        mainStack.distribution = .fill
        
        contentView.addSubview(mainStack)
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        
        timeStack.widthAnchor.constraint(equalToConstant: 40).isActive = true
        logosStack.widthAnchor.constraint(equalToConstant: 30).isActive = true
        teamsStack.widthAnchor.constraint(greaterThanOrEqualToConstant: 200).isActive = true
        scoreStack.widthAnchor.constraint(equalToConstant: 30).isActive = true

        
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            mainStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            mainStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            mainStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
        ])
    }
}

// MARK: - FinalScoreCell Configuration
extension ResultsCell {
    func configure(with match: MatchResult) {
        homeTeamLabel.text = match.homeTeam
        awayTeamLabel.text = match.awayTeam
        homeLogo.image = UIImage(named: match.homeLogo)
        awayLogo.image = UIImage(named: match.awayLogo)
        homeScore.text = "\(match.homeScore)"
        awayScore.text = "\(match.awayScore)"
        dateLabel.text = match.date
        isLive.text = match.isLive

    }
}
