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
            headerContainer.heightAnchor.constraint(equalToConstant: 24),
            
            flagImageView.leadingAnchor.constraint(equalTo: headerContainer.leadingAnchor),
            flagImageView.centerYAnchor.constraint(equalTo: headerContainer.centerYAnchor),
            flagImageView.widthAnchor.constraint(equalToConstant: 24),
            flagImageView.heightAnchor.constraint(equalToConstant: 24),
            
            leagueLabel.leadingAnchor.constraint(equalTo: flagImageView.trailingAnchor, constant: 12),
            leagueLabel.centerYAnchor.constraint(equalTo: headerContainer.centerYAnchor),
            
            gamesTableView.topAnchor.constraint(equalTo: headerContainer.bottomAnchor, constant: 8),
            gamesTableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            gamesTableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
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
        let cellHeight: CGFloat = 80
        let cellSpacing: CGFloat = 30
        let numberOfCells = CGFloat(leagueSection.matches.count)
        let totalCellHeight = numberOfCells * cellHeight
        
        return totalCellHeight + cellSpacing
    }
}

// MARK: - TableView DataSource & Delegate
extension MainCollectionCell: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return matches.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FinalScoreCell.identifier, for: indexPath) as! FinalScoreCell
        cell.backgroundColor = .customBackground
        cell.selectionStyle = .none
        cell.configure(with: matches[indexPath.section])
        return cell
    }
    
    // Space between custom cells
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 12
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }
}


//// MARK: - Extension for FinalScoreCell to work in TableView
//extension FinalScoreCell {
//    override func prepareForReuse() {
//        super.prepareForReuse()
//    }
//    
//    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
//        super.setHighlighted(highlighted, animated: animated)
//        contentView.backgroundColor = .cellColour
//    }
//}
//
//
