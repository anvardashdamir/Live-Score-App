//
//  LiveScoreCell.swift
//  Live Score App
//
//  Created by Dashdemirli Enver on 13.09.25.
//

import UIKit

final class LiveScoreCell: UICollectionViewCell {
    static let identifier = "LiveScoreCell"
    
    // MARK: - UI
    private let leagueFlag: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private let leagueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let liveIndicatorView: LiveIndicatorView = {
        let view = LiveIndicatorView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let homeLogo = UIImageView()
    private let awayLogo = UIImageView()
    
    private let homeLabel = UILabel()
    private let awayLabel = UILabel()
    
    private let scoreLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let detailsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Details", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        button.backgroundColor = .dotColour
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .cellColour
        contentView.layer.cornerRadius = 10
        contentView.clipsToBounds = true
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    // MARK: - Setup
    
    private func setupViews() {
        // League row
        let leagueStack = UIStackView(arrangedSubviews: [leagueFlag, leagueLabel, UIView()])
        leagueStack.axis = .horizontal
        leagueStack.alignment = .center
        leagueStack.spacing = 8
        leagueStack.translatesAutoresizingMaskIntoConstraints = false
        
        // Teams row
        setupTeamLabel(homeLabel)
        setupTeamLabel(awayLabel)
        homeLogo.contentMode = .scaleAspectFit
        awayLogo.contentMode = .scaleAspectFit
        [homeLogo, awayLogo].forEach { $0.translatesAutoresizingMaskIntoConstraints = false } // LESSON how to use $0
        
        let homeStack = UIStackView(arrangedSubviews: [homeLogo, homeLabel])
        homeStack.axis = .vertical
        homeStack.alignment = .center
        homeStack.spacing = 4
        
        let awayStack = UIStackView(arrangedSubviews: [awayLogo, awayLabel])
        awayStack.axis = .vertical
        awayStack.alignment = .center
        awayStack.spacing = 4
        
        let teamsStack = UIStackView(arrangedSubviews: [homeStack, scoreLabel, awayStack])
        teamsStack.axis = .horizontal
        teamsStack.alignment = .center
        teamsStack.distribution = .equalCentering
        teamsStack.translatesAutoresizingMaskIntoConstraints = false
        
        // Main layout
        contentView.addSubview(leagueStack)
        contentView.addSubview(teamsStack)
        contentView.addSubview(detailsButton)
        contentView.addSubview(liveIndicatorView)
        
        liveIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            leagueStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            leagueStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            leagueStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            
            liveIndicatorView.centerYAnchor.constraint(equalTo: leagueStack.centerYAnchor),
            liveIndicatorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            
            teamsStack.topAnchor.constraint(equalTo: leagueStack.bottomAnchor, constant: 16),
            teamsStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            teamsStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            teamsStack.heightAnchor.constraint(equalToConstant: 80),
            
            detailsButton.topAnchor.constraint(equalTo: teamsStack.bottomAnchor, constant: 12),
            detailsButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            detailsButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            detailsButton.heightAnchor.constraint(equalToConstant: 40),
            detailsButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            
            homeLogo.widthAnchor.constraint(equalToConstant: 40),
            homeLogo.heightAnchor.constraint(equalToConstant: 40),
            awayLogo.widthAnchor.constraint(equalToConstant: 40),
            awayLogo.heightAnchor.constraint(equalToConstant: 40),
            leagueFlag.widthAnchor.constraint(equalToConstant: 24),
            leagueFlag.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    private func setupTeamLabel(_ label: UILabel) {
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension LiveScoreMatch {
    static let mockData: [LiveScoreMatch] = [
        LiveScoreMatch(
            leagueName: "Premier League",
            leagueFlag: "englandFlag",
            isLive: true,
            homeTeamName: "Manchester\nUnited",
            homeTeamLogo: "manutd",
            awayTeamName: "Nottingham\nForest",
            awayTeamLogo: "forest",
            homeScore: 3,
            awayScore: 0
        ),
        LiveScoreMatch(
            leagueName: "La Liga",
            leagueFlag: "spainFlag",
            isLive: true,
            homeTeamName: "Real\nMadrid",
            homeTeamLogo: "realmadrid",
            awayTeamName: "FC\nBarcelona",
            awayTeamLogo: "barcelona",
            homeScore: 5,
            awayScore: 5
        )
    ]
}


extension LiveScoreCell {
    func configure(with match: LiveScoreMatch) {
        // Configure league info
        leagueLabel.text = match.leagueName
        leagueFlag.image = UIImage(named: match.leagueFlag)
        
        // Configure live status
        liveIndicatorView.setLive(match.isLive)
        
        // Configure teams
        homeLabel.text = match.homeTeamName
        awayLabel.text = match.awayTeamName
        homeLogo.image = UIImage(named: match.homeTeamLogo)
        awayLogo.image = UIImage(named: match.awayTeamLogo)
        
        // Configure score
        scoreLabel.text = "\(match.homeScore) - \(match.awayScore)"
    }
}


