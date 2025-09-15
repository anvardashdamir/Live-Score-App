//
//  FinalScoreCell.swift
//  Live Score App
//
//  Created by Dashdemirli Enver on 13.09.25.
//

import UIKit

struct FinalScoreMatch {
    let leagueName: String
    let homeTeamName: String
    let homeTeamLogo: String // Image name or URL
    let awayTeamName: String
    let awayTeamLogo: String // Image name or URL
    let homeScore: Int
    let awayScore: Int
    let matchDate: Date
}

class FinalScoreCell: UICollectionViewCell {
    static let identifier = "FinalScoreCell"
    
    // MARK: - UI Elements
//    private let leagueLabel: UILabel = {
//        let label = UILabel()
//        label.font = UIFont.boldSystemFont(ofSize: 14)
//        label.textColor = .darkGray
//        return label
//    }()
    
    private let homeLogo: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.widthAnchor.constraint(equalToConstant: 30).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 30).isActive = true
        return iv
    }()
    
    private let awayLogo: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.widthAnchor.constraint(equalToConstant: 30).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 30).isActive = true
        return iv
    }()
    
    private let homeTeamLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .black
        return label
    }()
    
    private let awayTeamLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .black
        return label
    }()
    
    private let scoreLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .systemBlue
        label.textAlignment = .center
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .gray
        return label
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    private func setupLayout() {
        let teamsStack = UIStackView(arrangedSubviews: [homeTeamLabel, awayTeamLabel])
        teamsStack.axis = .vertical
        teamsStack.spacing = 4
        
        let logosStack = UIStackView(arrangedSubviews: [homeLogo, awayLogo])
        logosStack.axis = .vertical
        logosStack.alignment = .center
        logosStack.spacing = 4
        
        let mainStack = UIStackView(arrangedSubviews: [logosStack, teamsStack, scoreLabel])
        mainStack.axis = .horizontal
        mainStack.spacing = 12
        mainStack.alignment = .center
        mainStack.distribution = .equalSpacing
        
        let container = UIStackView(arrangedSubviews: [dateLabel, mainStack])
        container.axis = .vertical
        container.spacing = 8
        
        contentView.addSubview(container)
        contentView.backgroundColor = .blue
        container.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: contentView.topAnchor),
            container.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            container.widthAnchor.constraint(equalToConstant: 120),
            container.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}


// MARK: - Mock Data
extension FinalScoreMatch {
    static let mockData: [FinalScoreMatch] = [
        FinalScoreMatch(
            leagueName: "Premier League",
            homeTeamName: "Arsenal",
            homeTeamLogo: "arsenal_logo",
            awayTeamName: "Chelsea",
            awayTeamLogo: "chelsea_logo",
            homeScore: 2,
            awayScore: 0,
            matchDate: Calendar.current.date(byAdding: .day, value: -1, to: Date()) ?? Date()
        ),
        
        FinalScoreMatch(
            leagueName: "Premier League",
            homeTeamName: "Manchester City",
            homeTeamLogo: "man_city_logo",
            awayTeamName: "Tottenham",
            awayTeamLogo: "tottenham_logo",
            homeScore: 1,
            awayScore: 3,
            matchDate: Calendar.current.date(byAdding: .day, value: -2, to: Date()) ?? Date()
        ),
        
        FinalScoreMatch(
            leagueName: "La Liga",
            homeTeamName: "Atletico Madrid",
            homeTeamLogo: "atletico_logo",
            awayTeamName: "Valencia",
            awayTeamLogo: "valencia_logo",
            homeScore: 1,
            awayScore: 1,
            matchDate: Calendar.current.date(byAdding: .day, value: -3, to: Date()) ?? Date()
        ),
        
        FinalScoreMatch(
            leagueName: "Bundesliga",
            homeTeamName: "Bayern Munich",
            homeTeamLogo: "bayern_logo",
            awayTeamName: "Dortmund",
            awayTeamLogo: "dortmund_logo",
            homeScore: 4,
            awayScore: 2,
            matchDate: Calendar.current.date(byAdding: .day, value: -4, to: Date()) ?? Date()
        ),
        
        FinalScoreMatch(
            leagueName: "Serie A",
            homeTeamName: "Juventus",
            homeTeamLogo: "juventus_logo",
            awayTeamName: "AC Milan",
            awayTeamLogo: "milan_logo",
            homeScore: 0,
            awayScore: 2,
            matchDate: Calendar.current.date(byAdding: .day, value: -5, to: Date()) ?? Date()
        )
    ]
}


// MARK: - FinalScoreCell Configuration
extension FinalScoreCell {
    func configure(with match: FinalScoreMatch) {
        // Configure league
//        leagueLabel.text = match.leagueName
        
        // Configure teams
        homeTeamLabel.text = match.homeTeamName
        awayTeamLabel.text = match.awayTeamName
        homeLogo.image = UIImage(named: match.homeTeamLogo) // or load from URL
        awayLogo.image = UIImage(named: match.awayTeamLogo) // or load from URL
        
        // Configure score
        scoreLabel.text = "\(match.homeScore) - \(match.awayScore)"
        
        // Configure date
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        dateLabel.text = formatter.string(from: match.matchDate)
    }
}
