//
//  MainCollectionCell.swift
//  Live Score App
//
//  Created by Dashdemirli Enver on 17.09.25.
//

import UIKit

class MainCollectionCell: UICollectionViewCell {
    static let identifier = "MainCollectionCell"
    
    // MARK: - Header UI Elements
    private let flagImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let leagueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - TableView for Games
    private lazy var gamesTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .customBackground
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = false // Only main collection scrolls
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(FinalScoreCell.self, forCellReuseIdentifier: FinalScoreCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - Data
    private var matches: [FinalScoreMatch] = []
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        backgroundColor = .clear
        
        // Header container
        let headerContainer = UIView()
        headerContainer.backgroundColor = .clear
        headerContainer.translatesAutoresizingMaskIntoConstraints = false
        
        headerContainer.addSubview(flagImageView)
        headerContainer.addSubview(leagueLabel)
        
        contentView.addSubview(headerContainer)
        contentView.addSubview(gamesTableView)
        
        NSLayoutConstraint.activate([
            headerContainer.topAnchor.constraint(equalTo: contentView.topAnchor),
            headerContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            headerContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            headerContainer.heightAnchor.constraint(equalToConstant: 44),
            
            flagImageView.leadingAnchor.constraint(equalTo: headerContainer.leadingAnchor, constant: 16),
            flagImageView.centerYAnchor.constraint(equalTo: headerContainer.centerYAnchor),
            flagImageView.widthAnchor.constraint(equalToConstant: 24),
            flagImageView.heightAnchor.constraint(equalToConstant: 24),
            
            // League label
            leagueLabel.leadingAnchor.constraint(equalTo: flagImageView.trailingAnchor, constant: 12),
            leagueLabel.centerYAnchor.constraint(equalTo: headerContainer.centerYAnchor),
            leagueLabel.trailingAnchor.constraint(equalTo: headerContainer.trailingAnchor, constant: -16), // take a look
            
            // Games table
            gamesTableView.topAnchor.constraint(equalTo: headerContainer.bottomAnchor, constant: 8),
            gamesTableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            gamesTableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            gamesTableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    // MARK: - Configuration
    func configure(with leagueSection: LeagueSection) {
        leagueLabel.text = leagueSection.leagueName
        flagImageView.image = UIImage(named: leagueSection.leagueFlag)
        
        matches = leagueSection.matches
        gamesTableView.reloadData()
    }
    
    // MARK: - Height Calculation
    static func calculateHeight(for leagueSection: LeagueSection, width: CGFloat) -> CGFloat {
        let headerHeight: CGFloat = 44
        let topPadding: CGFloat = 8
        let bottomPadding: CGFloat = 16
        let gameHeight: CGFloat = 80 // Approximate height per game including spacing
        
        let numberOfGames = CGFloat(leagueSection.matches.count)
        let totalGamesHeight = numberOfGames * gameHeight
        
        return headerHeight + topPadding + totalGamesHeight + bottomPadding
    }
}

// MARK: - TableView DataSource & Delegate
extension MainCollectionCell: UITableViewDataSource, UITableViewDelegate {
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FinalScoreMatch.premierLeagueMatches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FinalScoreCell.identifier, for: indexPath) as! FinalScoreCell
        if indexPath.row < matches.count {
            cell.configure(with: matches[indexPath.row])
        }
        return cell
    }

}


// MARK: - Extension for FinalScoreCell to work in TableView
extension FinalScoreCell {
    
    // Override to work properly in TableView
    override func prepareForReuse() {
        super.prepareForReuse()
        // Clear any data if needed
    }
    
    // Add this method to ensure proper TableView cell behavior
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Maintain the background color when selected
        if selected {
            contentView.backgroundColor = .cellColour
        }
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        // Maintain the background color when highlighted
        contentView.backgroundColor = .cellColour
    }
}


