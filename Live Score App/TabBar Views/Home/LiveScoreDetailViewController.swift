//
//  LiveScoreDetailViewController.swift
//  Live Score App
//
//  Created by Dashdemirli Enver on 26.09.25.
//

import UIKit

class LiveScoreDetailViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.showsVerticalScrollIndicator = true
        return sv
    }()
    
    private let contentStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 16
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    // MARK: - Match Summary Card
    private let matchSummaryCard: UIView = {
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
    
    // MARK: - Detail Sections
    private let goalsCard: UIView = {
        let view = UIView()
        view.backgroundColor = .cellColour
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let cardsCard: UIView = {
        let view = UIView()
        view.backgroundColor = .cellColour
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let substitutionsCard: UIView = {
        let view = UIView()
        view.backgroundColor = .cellColour
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var match: LiveScoreMatch?
    private var matchDetail: MatchDetail?
    
    convenience init(match: LiveScoreMatch) {
        self.init()
        self.match = match
        self.matchDetail = MatchDetail.getMockDetail(for: match)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .customBackground
        title = "Match Details"
        setupViews()
    }
    
    private func setupViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentStackView)
        
        setupMatchSummaryCard()
        
        contentStackView.addArrangedSubview(matchSummaryCard)
        contentStackView.addArrangedSubview(goalsCard)
        contentStackView.addArrangedSubview(cardsCard)
        contentStackView.addArrangedSubview(substitutionsCard)
        
        setupGoalsCard()
        setupCardsCard()
        setupSubstitutionsCard()
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentStackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16),
            contentStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            contentStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            contentStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -16),
            contentStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -32)
        ])
    }
    
    private func setupMatchSummaryCard() {
        let leagueStack = UIStackView(arrangedSubviews: [leagueFlag, leagueLabel])
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
        
        matchSummaryCard.addSubview(leagueStack)
        matchSummaryCard.addSubview(liveIndicatorView)
        matchSummaryCard.addSubview(teamsStack)
        
        NSLayoutConstraint.activate([
            leagueFlag.widthAnchor.constraint(equalToConstant: 24),
            leagueFlag.heightAnchor.constraint(equalToConstant: 24),
            
            leagueStack.topAnchor.constraint(equalTo: matchSummaryCard.topAnchor, constant: 12),
            leagueStack.leadingAnchor.constraint(equalTo: matchSummaryCard.leadingAnchor, constant: 12),
            
            liveIndicatorView.centerYAnchor.constraint(equalTo: leagueStack.centerYAnchor),
            liveIndicatorView.trailingAnchor.constraint(equalTo: matchSummaryCard.trailingAnchor, constant: -16),
            
            teamsStack.topAnchor.constraint(equalTo: leagueStack.bottomAnchor, constant: 16),
            teamsStack.leadingAnchor.constraint(equalTo: matchSummaryCard.leadingAnchor, constant: 16),
            teamsStack.trailingAnchor.constraint(equalTo: matchSummaryCard.trailingAnchor, constant: -16),
            teamsStack.bottomAnchor.constraint(equalTo: matchSummaryCard.bottomAnchor, constant: -16),
            teamsStack.heightAnchor.constraint(equalToConstant: 80),
            
            homeLogo.widthAnchor.constraint(equalToConstant: 40),
            homeLogo.heightAnchor.constraint(equalToConstant: 40),
            awayLogo.widthAnchor.constraint(equalToConstant: 40),
            awayLogo.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func setupGoalsCard() {
        let titleLabel = createSectionTitle("⚽️ Goals")
        goalsCard.addSubview(titleLabel)
        
        let goalsStack = UIStackView()
        goalsStack.axis = .vertical
        goalsStack.spacing = 8
        goalsStack.tag = 100
        goalsStack.translatesAutoresizingMaskIntoConstraints = false
        goalsCard.addSubview(goalsStack)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: goalsCard.topAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: goalsCard.leadingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: goalsCard.trailingAnchor, constant: -12),
            
            goalsStack.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            goalsStack.leadingAnchor.constraint(equalTo: goalsCard.leadingAnchor, constant: 12),
            goalsStack.trailingAnchor.constraint(equalTo: goalsCard.trailingAnchor, constant: -12),
            goalsStack.bottomAnchor.constraint(equalTo: goalsCard.bottomAnchor, constant: -12)
        ])
    }
    
    private func setupCardsCard() {
        let titleLabel = createSectionTitle("🟨 Cards")
        cardsCard.addSubview(titleLabel)
        
        let cardsStack = UIStackView()
        cardsStack.axis = .vertical
        cardsStack.spacing = 8
        cardsStack.tag = 101
        cardsStack.translatesAutoresizingMaskIntoConstraints = false
        cardsCard.addSubview(cardsStack)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: cardsCard.topAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: cardsCard.leadingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: cardsCard.trailingAnchor, constant: -12),
            
            cardsStack.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            cardsStack.leadingAnchor.constraint(equalTo: cardsCard.leadingAnchor, constant: 12),
            cardsStack.trailingAnchor.constraint(equalTo: cardsCard.trailingAnchor, constant: -12),
            cardsStack.bottomAnchor.constraint(equalTo: cardsCard.bottomAnchor, constant: -12)
        ])
    }
    
    private func setupSubstitutionsCard() {
        let titleLabel = createSectionTitle("🔄 Substitutions")
        substitutionsCard.addSubview(titleLabel)
        
        let subsStack = UIStackView()
        subsStack.axis = .vertical
        subsStack.spacing = 8
        subsStack.tag = 102
        subsStack.translatesAutoresizingMaskIntoConstraints = false
        substitutionsCard.addSubview(subsStack)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: substitutionsCard.topAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: substitutionsCard.leadingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: substitutionsCard.trailingAnchor, constant: -12),
            
            subsStack.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            subsStack.leadingAnchor.constraint(equalTo: substitutionsCard.leadingAnchor, constant: 12),
            subsStack.trailingAnchor.constraint(equalTo: substitutionsCard.trailingAnchor, constant: -12),
            subsStack.bottomAnchor.constraint(equalTo: substitutionsCard.bottomAnchor, constant: -12)
        ])
    }
    
    private func createSectionTitle(_ text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    private func createEventView(time: String, player: String, isHome: Bool) -> UIView {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        
        let timeLabel = UILabel()
        timeLabel.text = time
        timeLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        timeLabel.textColor = .dotColour
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let playerLabel = UILabel()
        playerLabel.text = player
        playerLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        playerLabel.textColor = .white
        playerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        container.addSubview(timeLabel)
        container.addSubview(playerLabel)
        
        NSLayoutConstraint.activate([
            timeLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            timeLabel.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            timeLabel.widthAnchor.constraint(equalToConstant: 40),
            
            playerLabel.leadingAnchor.constraint(equalTo: timeLabel.trailingAnchor, constant: 12),
            playerLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            playerLabel.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            
            container.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        if !isHome {
            playerLabel.textAlignment = .right
            timeLabel.removeFromSuperview()
            playerLabel.removeFromSuperview()
            
            container.addSubview(playerLabel)
            container.addSubview(timeLabel)
            
            NSLayoutConstraint.activate([
                playerLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor),
                playerLabel.trailingAnchor.constraint(equalTo: timeLabel.leadingAnchor, constant: -12),
                playerLabel.centerYAnchor.constraint(equalTo: container.centerYAnchor),
                
                timeLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor),
                timeLabel.centerYAnchor.constraint(equalTo: container.centerYAnchor),
                timeLabel.widthAnchor.constraint(equalToConstant: 40)
            ])
        }
        
        return container
    }
    
    private func createSubstitutionView(time: String, playerOut: String, playerIn: String, isHome: Bool) -> UIView {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        
        let timeLabel = UILabel()
        timeLabel.text = time
        timeLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        timeLabel.textColor = .dotColour
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let outLabel = UILabel()
        outLabel.text = "↓ \(playerOut)"
        outLabel.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        outLabel.textColor = .lightGray
        outLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let inLabel = UILabel()
        inLabel.text = "↑ \(playerIn)"
        inLabel.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        inLabel.textColor = .white
        inLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let textStack = UIStackView(arrangedSubviews: [outLabel, inLabel])
        textStack.axis = .vertical
        textStack.spacing = 2
        textStack.translatesAutoresizingMaskIntoConstraints = false
        
        container.addSubview(timeLabel)
        container.addSubview(textStack)
        
        NSLayoutConstraint.activate([
            timeLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            timeLabel.topAnchor.constraint(equalTo: container.topAnchor),
            timeLabel.widthAnchor.constraint(equalToConstant: 40),
            
            textStack.leadingAnchor.constraint(equalTo: timeLabel.trailingAnchor, constant: 12),
            textStack.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            textStack.topAnchor.constraint(equalTo: container.topAnchor),
            textStack.bottomAnchor.constraint(equalTo: container.bottomAnchor)
        ])
        
        if !isHome {
            outLabel.textAlignment = .right
            inLabel.textAlignment = .right
            timeLabel.removeFromSuperview()
            textStack.removeFromSuperview()
            
            container.addSubview(textStack)
            container.addSubview(timeLabel)
            
            NSLayoutConstraint.activate([
                textStack.leadingAnchor.constraint(equalTo: container.leadingAnchor),
                textStack.trailingAnchor.constraint(equalTo: timeLabel.leadingAnchor, constant: -12),
                textStack.topAnchor.constraint(equalTo: container.topAnchor),
                textStack.bottomAnchor.constraint(equalTo: container.bottomAnchor),
                
                timeLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor),
                timeLabel.topAnchor.constraint(equalTo: container.topAnchor),
                timeLabel.widthAnchor.constraint(equalToConstant: 40)
            ])
        }
        
        return container
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
        
        configureGoals(for: match)
        configureCards(for: match)
        configureSubstitutions(for: match)
    }
    
    private func configureGoals(for match: LiveScoreMatch) {
        guard let goalsStack = goalsCard.viewWithTag(100) as? UIStackView else { return }
        goalsStack.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        let goals = matchDetail?.goals ?? []
        
        if goals.isEmpty {
            let noGoalsLabel = UILabel()
            noGoalsLabel.text = "No goals scored yet"
            noGoalsLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
            noGoalsLabel.textColor = .lightGray
            noGoalsLabel.textAlignment = .center
            goalsStack.addArrangedSubview(noGoalsLabel)
        } else {
            goals.forEach { goal in
                let playerText = goal.assistBy != nil ? "\(goal.playerName) (Assist: \(goal.assistBy!))" : goal.playerName
                let goalView = createEventView(time: goal.time, player: playerText, isHome: goal.isHomeTeam)
                goalsStack.addArrangedSubview(goalView)
            }
        }
    }
    
    private func configureCards(for match: LiveScoreMatch) {
        guard let cardsStack = cardsCard.viewWithTag(101) as? UIStackView else { return }
        
        cardsStack.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        let cards = matchDetail?.cards ?? []
        
        if cards.isEmpty {
            let noCardsLabel = UILabel()
            noCardsLabel.text = "No cards yet"
            noCardsLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
            noCardsLabel.textColor = .lightGray
            noCardsLabel.textAlignment = .center
            cardsStack.addArrangedSubview(noCardsLabel)
        } else {
            cards.forEach { card in
                let cardText = "\(card.playerName) (\(card.cardType.displayText))"
                let cardView = createEventView(time: card.time, player: cardText, isHome: card.isHomeTeam)
                cardsStack.addArrangedSubview(cardView)
            }
        }
    }
    
    private func configureSubstitutions(for match: LiveScoreMatch) {
        guard let subsStack = substitutionsCard.viewWithTag(102) as? UIStackView else { return }
        
        subsStack.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        let substitutions = matchDetail?.substitutions ?? []
        
        if substitutions.isEmpty {
            let noSubsLabel = UILabel()
            noSubsLabel.text = "No substitutions yet"
            noSubsLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
            noSubsLabel.textColor = .lightGray
            noSubsLabel.textAlignment = .center
            subsStack.addArrangedSubview(noSubsLabel)
        } else {
            substitutions.forEach { sub in
                let subView = createSubstitutionView(
                    time: sub.time,
                    playerOut: sub.playerOut,
                    playerIn: sub.playerIn,
                    isHome: sub.isHomeTeam
                )
                subsStack.addArrangedSubview(subView)
            }
        }
    }
}
