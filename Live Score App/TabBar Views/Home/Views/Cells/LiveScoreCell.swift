//
//  LiveScoreCell.swift
//  Live Score App
//
//  Created by Dashdemirli Enver on 13.09.25.
//

import UIKit

final class LiveScoreCell: UICollectionViewCell {
    static let identifier = "LiveScoreCell"
    private var storedMatch: LiveScoreMatch?

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
    
    @objc func didTapDetailsButton() {
        guard let match = storedMatch else { return }
        let vc = LiveScoreDetailViewController(match: match)
        if let nav = self.parentViewController?.navigationController {
            nav.pushViewController(vc, animated: true)
        } else {
            self.parentViewController?.present(vc, animated: true)
        }
    }
        
    private func setupViews() {
        let leagueStack = UIStackView(arrangedSubviews: [leagueFlag, leagueLabel, UIView()])
        leagueStack.axis = .horizontal
        leagueStack.alignment = .center
        leagueStack.spacing = 8
        leagueStack.translatesAutoresizingMaskIntoConstraints = false
        
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
        
        contentView.addSubview(leagueStack)
        contentView.addSubview(teamsStack)
        contentView.addSubview(detailsButton)
        contentView.addSubview(liveIndicatorView)
        
        detailsButton.addTarget(self, action: #selector(didTapDetailsButton), for: .touchUpInside)
        
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


extension LiveScoreCell {
    func configure(with match: LiveScoreMatch) {
        self.storedMatch = match
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

private extension UIView {
    var parentViewController: UIViewController? {
        var responder: UIResponder? = self
        while let next = responder?.next {
            if let vc = next as? UIViewController {
                return vc
            }
            responder = next
        }
        return nil
    }
}
