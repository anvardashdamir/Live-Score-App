//
//  LiveScoreDetailViewController.swift
//  Live Score App
//
//  Created by Dashdemirli Enver on 26.09.25.
//

import UIKit

class LiveScoreDetailViewController: UIViewController {
    
    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .cellColour
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
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
    
    // Add property to hold match data
    private var match: LiveScoreMatch?
    
    // Add convenience initializer
    convenience init(match: LiveScoreMatch) {
        self.init()
        self.match = match
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        view.backgroundColor = .customBackground
        title = "Match Details"

        // Configure with match data if available
        if let match = match {
            configure(with: match)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    private func setupViews() {
        // Add contentView to main view first
        view.addSubview(contentView)
        
        let leagueStack = UIStackView(arrangedSubviews: [leagueFlag, leagueLabel, UIView()])
        leagueStack.axis = .horizontal
        leagueStack.alignment = .center
        leagueStack.spacing = 8
        leagueStack.translatesAutoresizingMaskIntoConstraints = false
        
        setupTeamLabel(homeLabel)
        setupTeamLabel(awayLabel)
        homeLogo.contentMode = .scaleAspectFit
        awayLogo.contentMode = .scaleAspectFit
        [homeLogo, awayLogo].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
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
        
        // Add subviews to contentView instead of main view
        contentView.addSubview(leagueStack)
        contentView.addSubview(teamsStack)
        contentView.addSubview(liveIndicatorView)
        
        NSLayoutConstraint.activate([
            // ContentView constraints
            contentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            contentView.bottomAnchor.constraint(equalTo: teamsStack.bottomAnchor, constant: 16),
            
            // League stack constraints (relative to contentView)
            leagueStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            leagueStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            leagueStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            
            // Live indicator constraints
            liveIndicatorView.centerYAnchor.constraint(equalTo: leagueStack.centerYAnchor),
            liveIndicatorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            // Teams stack constraints
            teamsStack.topAnchor.constraint(equalTo: leagueStack.bottomAnchor, constant: 16),
            teamsStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            teamsStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            teamsStack.heightAnchor.constraint(equalToConstant: 80),
            
            // Logo constraints
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

// MARK: - Configuration
extension LiveScoreDetailViewController {
    func configure(with match: LiveScoreMatch) {
        leagueLabel.text = match.leagueName
        leagueFlag.image = UIImage(named: match.leagueFlag)
        liveIndicatorView.setLive(match.isLive)
        homeLabel.text = match.homeTeamName
        awayLabel.text = match.awayTeamName
        homeLogo.image = UIImage(named: match.homeTeamLogo)
        awayLogo.image = UIImage(named: match.awayTeamLogo)
        scoreLabel.text = "\(match.homeScore) - \(match.awayScore)"
    }
}

// MARK: - Mock Data
extension LiveScoreDetailViewController {
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
