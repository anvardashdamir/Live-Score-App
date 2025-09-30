//
//  ClubDetailViewController.swift
//  Live Score App
//
//  Created by Dashdemirli Enver on 29.09.25.
//

import UIKit

class ClubDetailViewController: UIViewController {
    
    private var club: Club
    
    private var isFavourite: Bool = false
    
    private let scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    private let contentStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 16
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let headerCard: UIView = {
        let view = UIView()
        view.backgroundColor = .cellColour
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let clubLogo: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private let clubNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let leagueFlag: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private let leagueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .lightGray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let infoCard: UIView = {
        let view = UIView()
        view.backgroundColor = .cellColour
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let squadCard: UIView = {
        let view = UIView()
        view.backgroundColor = .cellColour
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    init(club: Club) {
        self.club = club
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .customBackground
        title = club.name
        setupViews()
        configureClub()
        setupStarButton()
        loadFavouriteState()
    }
    
    private func setupStarButton() {
            let starButton = UIBarButtonItem(
                image: UIImage(systemName: "star"),
                style: .plain,
                target: self,
                action: #selector(didTapStar)
            )
            navigationItem.rightBarButtonItem = starButton
            updateStarButton()
        }
    
    private func updateStarButton() {
          let imageName = isFavourite ? "star.fill" : "star"
          navigationItem.rightBarButtonItem?.image = UIImage(systemName: imageName)
      }
    
    @objc private func didTapStar() {
            isFavourite.toggle()
            updateStarButton()
            saveFavouriteState()
        }
    
    private func saveFavouriteState() {
        let defaults = UserDefaults.standard
        var favourites = defaults.stringArray(forKey: "favouriteClubIDs") ?? []
        
        if isFavourite {
            if !favourites.contains(club.id) {
                favourites.append(club.id)
            }
        } else {
            favourites.removeAll { $0 == club.id }
        }
        
        defaults.set(favourites, forKey: "favouriteClubIDs")
    }

    private func loadFavouriteState() {
        let defaults = UserDefaults.standard
        let favourites = defaults.stringArray(forKey: "favouriteClubIDs") ?? []
        isFavourite = favourites.contains(club.id)
        updateStarButton()
    }
    
    private func setupViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentStackView)
        
        contentStackView.addArrangedSubview(headerCard)
        contentStackView.addArrangedSubview(infoCard)
        contentStackView.addArrangedSubview(squadCard)
        
        setupHeaderCard()
        setupInfoCard()
        setupSquadCard()
        
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
    
    private func setupHeaderCard() {
        let leagueStack = UIStackView(arrangedSubviews: [leagueFlag, leagueLabel])
        leagueStack.axis = .horizontal
        leagueStack.spacing = 8
        leagueStack.alignment = .center
        leagueStack.translatesAutoresizingMaskIntoConstraints = false
        
        headerCard.addSubview(clubLogo)
        headerCard.addSubview(clubNameLabel)
        headerCard.addSubview(leagueStack)
        
        NSLayoutConstraint.activate([
            clubLogo.topAnchor.constraint(equalTo: headerCard.topAnchor, constant: 20),
            clubLogo.centerXAnchor.constraint(equalTo: headerCard.centerXAnchor),
            clubLogo.widthAnchor.constraint(equalToConstant: 80),
            clubLogo.heightAnchor.constraint(equalToConstant: 80),
            
            clubNameLabel.topAnchor.constraint(equalTo: clubLogo.bottomAnchor, constant: 12),
            clubNameLabel.leadingAnchor.constraint(equalTo: headerCard.leadingAnchor, constant: 16),
            clubNameLabel.trailingAnchor.constraint(equalTo: headerCard.trailingAnchor, constant: -16),
            
            leagueStack.topAnchor.constraint(equalTo: clubNameLabel.bottomAnchor, constant: 8),
            leagueStack.centerXAnchor.constraint(equalTo: headerCard.centerXAnchor),
            leagueStack.bottomAnchor.constraint(equalTo: headerCard.bottomAnchor, constant: -20),
            
            leagueFlag.widthAnchor.constraint(equalToConstant: 24),
            leagueFlag.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    private func setupInfoCard() {
        let titleLabel = createSectionTitle("ℹ️ Club Information")
        infoCard.addSubview(titleLabel)
        
        let infoStack = UIStackView()
        infoStack.axis = .vertical
        infoStack.spacing = 12
        infoStack.translatesAutoresizingMaskIntoConstraints = false
        infoCard.addSubview(infoStack)
        
        let stadiumView = createInfoRow(icon: "🏟️", title: "Stadium", value: club.stadium)
        let foundedView = createInfoRow(icon: "📅", title: "Founded", value: club.founded)
        let managerView = createInfoRow(icon: "👔", title: "Manager", value: club.manager)
        
        [stadiumView, foundedView, managerView].forEach { infoStack.addArrangedSubview($0) }
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: infoCard.topAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: infoCard.leadingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: infoCard.trailingAnchor, constant: -12),
            
            infoStack.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            infoStack.leadingAnchor.constraint(equalTo: infoCard.leadingAnchor, constant: 12),
            infoStack.trailingAnchor.constraint(equalTo: infoCard.trailingAnchor, constant: -12),
            infoStack.bottomAnchor.constraint(equalTo: infoCard.bottomAnchor, constant: -12)
        ])
    }
    
    private func setupSquadCard() {
        let titleLabel = createSectionTitle("👥 Squad")
        squadCard.addSubview(titleLabel)
        
        let squadStack = UIStackView()
        squadStack.axis = .vertical
        squadStack.spacing = 8
        squadStack.translatesAutoresizingMaskIntoConstraints = false
        squadCard.addSubview(squadStack)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: squadCard.topAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: squadCard.leadingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: squadCard.trailingAnchor, constant: -12),
            
            squadStack.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            squadStack.leadingAnchor.constraint(equalTo: squadCard.leadingAnchor, constant: 12),
            squadStack.trailingAnchor.constraint(equalTo: squadCard.trailingAnchor, constant: -12),
            squadStack.bottomAnchor.constraint(equalTo: squadCard.bottomAnchor, constant: -12)
        ])
        
        let positions: [PlayerPosition] = [.goalkeeper, .defender, .midfielder, .forward]
        
        for position in positions {
            let playersInPosition = club.players.filter { $0.position == position }
            if !playersInPosition.isEmpty {
                let positionLabel = UILabel()
                positionLabel.text = position.rawValue
                positionLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
                positionLabel.textColor = .dotColour
                squadStack.addArrangedSubview(positionLabel)
                
                for player in playersInPosition {
                    let playerView = createPlayerRow(player: player)
                    squadStack.addArrangedSubview(playerView)
                }
                
                let spacer = UIView()
                spacer.translatesAutoresizingMaskIntoConstraints = false
                spacer.heightAnchor.constraint(equalToConstant: 8).isActive = true
                squadStack.addArrangedSubview(spacer)
            }
        }
    }
    
    private func createSectionTitle(_ text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    private func createInfoRow(icon: String, title: String, value: String) -> UIView {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        
        let iconLabel = UILabel()
        iconLabel.text = icon
        iconLabel.font = UIFont.systemFont(ofSize: 20)
        iconLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        titleLabel.textColor = .lightGray
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let valueLabel = UILabel()
        valueLabel.text = value
        valueLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        valueLabel.textColor = .white
        valueLabel.textAlignment = .right
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        
        container.addSubview(iconLabel)
        container.addSubview(titleLabel)
        container.addSubview(valueLabel)
        
        NSLayoutConstraint.activate([
            iconLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            iconLabel.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            iconLabel.widthAnchor.constraint(equalToConstant: 30),
            
            titleLabel.leadingAnchor.constraint(equalTo: iconLabel.trailingAnchor, constant: 8),
            titleLabel.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            
            valueLabel.leadingAnchor.constraint(greaterThanOrEqualTo: titleLabel.trailingAnchor, constant: 8),
            valueLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            valueLabel.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            
            container.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        return container
    }
    
    private func createPlayerRow(player: Player) -> UIView {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        
        let numberLabel = UILabel()
        numberLabel.text = player.number
        numberLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        numberLabel.textColor = .white
        numberLabel.textAlignment = .center
        numberLabel.backgroundColor = .dotColour
        numberLabel.layer.cornerRadius = 12
        numberLabel.clipsToBounds = true
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let nameLabel = UILabel()
        nameLabel.text = player.name
        nameLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        nameLabel.textColor = .white
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let ageLabel = UILabel()
        ageLabel.text = "Age \(player.age)"
        ageLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        ageLabel.textColor = .lightGray
        ageLabel.textAlignment = .right
        ageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        container.addSubview(numberLabel)
        container.addSubview(nameLabel)
        container.addSubview(ageLabel)
        
        NSLayoutConstraint.activate([
            numberLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            numberLabel.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            numberLabel.widthAnchor.constraint(equalToConstant: 24),
            numberLabel.heightAnchor.constraint(equalToConstant: 24),
            
            nameLabel.leadingAnchor.constraint(equalTo: numberLabel.trailingAnchor, constant: 12),
            nameLabel.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            
            ageLabel.leadingAnchor.constraint(greaterThanOrEqualTo: nameLabel.trailingAnchor, constant: 8),
            ageLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            ageLabel.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            
            container.heightAnchor.constraint(equalToConstant: 32)
        ])
        
        return container
    }
    
    private func configureClub() {
        clubLogo.image = UIImage(named: club.logo)
        clubNameLabel.text = club.name
        leagueFlag.image = UIImage(named: club.leagueFlag)
        leagueLabel.text = club.league
    }
}
