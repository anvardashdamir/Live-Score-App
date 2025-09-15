//
//  FinalScoreCell.swift
//  Live Score App
//
//  Created by Dashdemirli Enver on 13.09.25.
//

import UIKit

struct FinalScoreMatch {
    let leagueName: String
    let leagueFlag: String
    let isLive: String
    let homeTeamName: String
    let homeTeamLogo: String
    let awayTeamName: String
    let awayTeamLogo: String
    let homeScore: Int
    let awayScore: Int
    let matchDate: String
}


class FinalScoreCell: UICollectionViewCell {
    static let identifier = "FinalScoreCell"
    
    // MARK: - UI Elements
    private let leagueFlag: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    private let leagueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
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
        contentView.backgroundColor = .cellColour
        contentView.layer.cornerRadius = 12
        contentView.clipsToBounds = true

        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    private func setupLayout() {
        
        let timeStack = UIStackView(arrangedSubviews: [dateLabel, isLive])
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
        mainStack.distribution = .fillProportionally
        
//        let container = UIStackView(arrangedSubviews: [dateLabel, mainStack])
//        container.axis = .vertical
//        container.spacing = 8
        
        contentView.addSubview(mainStack)
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        [dateLabel, isLive, homeLogo, awayLogo, homeTeamLabel, awayTeamLabel, homeScore, awayScore].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            mainStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}


// MARK: - Mock Data
extension FinalScoreMatch {
    static let mockData: [FinalScoreMatch] = [
        FinalScoreMatch(
            leagueName: "Premier League",
            leagueFlag: "englandFlag",
            isLive: "FT",
            homeTeamName: "Manchester United",
            homeTeamLogo: "manutd",
            awayTeamName: "Nottingam Forest",
            awayTeamLogo: "forest",
            homeScore: 3,
            awayScore: 0,
            matchDate: "15/9"
        ),
        
        FinalScoreMatch(
            leagueName: "Premier League",
            leagueFlag: "englandFlag",
            isLive: "FT",
            homeTeamName: "Westham United",
            homeTeamLogo: "westham",
            awayTeamName: "Arsenal",
            awayTeamLogo: "arsenal",
            homeScore: 2,
            awayScore: 2,
            matchDate: "14/9"
        ),

        FinalScoreMatch(
            leagueName: "Premier League",
            leagueFlag: "englandFlag",
            isLive: "FT",
            homeTeamName: "Chelsea",
            homeTeamLogo: "chelsea",
            awayTeamName: "Brighton & Hove Albion",
            awayTeamLogo: "brighton",
            homeScore: 2,
            awayScore: 1,
            matchDate: "15/9"
        ),

        FinalScoreMatch(
            leagueName: "Premier League",
            leagueFlag: "englandFlag",
            isLive: "FT",
            homeTeamName: "Manchester United",
            homeTeamLogo: "manutd",
            awayTeamName: "Nottingam FOrrest",
            awayTeamLogo: "forest",
            homeScore: 5,
            awayScore: 0,
            matchDate: "14/9"
        ),

        FinalScoreMatch(
            leagueName: "Premier League",
            leagueFlag: "englandFlag",
            isLive: "FT",
            homeTeamName: "Manchester City",
            homeTeamLogo: "mancity",
            awayTeamName: "Leicester City",
            awayTeamLogo: "leicester",
            homeScore: 3,
            awayScore: 1,
            matchDate: "14/9"
        ),
    ]
}


// MARK: - FinalScoreCell Configuration
extension FinalScoreCell {
    func configure(with match: FinalScoreMatch) {
        // Configure league
        leagueLabel.text = match.leagueName
        leagueFlag.image = UIImage(named: match.leagueFlag)
        
        // Configure teams
        homeTeamLabel.text = match.homeTeamName
        awayTeamLabel.text = match.awayTeamName
        homeLogo.image = UIImage(named: match.homeTeamLogo) // or load from URL
        awayLogo.image = UIImage(named: match.awayTeamLogo) // or load from URL
        
        // Configure score
        homeScore.text = "\(match.homeScore)"
        awayScore.text = "\(match.awayScore)"
        // Configure date
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        dateLabel.text = match.matchDate
    }
}
