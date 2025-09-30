//
//  SearchResultsViewController.swift
//  Live Score App
//

import UIKit

protocol SearchResultsDelegate: AnyObject {
    func didSelectClub(_ club: Club)
}

class SearchResultsViewController: UIViewController {
    
    weak var delegate: SearchResultsDelegate?
    
    private let tableView: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = .customBackground
        tv.separatorStyle = .none
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.register(ClubSearchCell.self, forCellReuseIdentifier: ClubSearchCell.identifier)
        return tv
    }()
    
    private let emptyStateLabel: UILabel = {
        let label = UILabel()
        label.text = "No results found"
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .lightGray
        label.textAlignment = .center
        label.isHidden = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var allClubs: [Club] = Club.mockClubs
    private var filteredClubs: [Club] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .customBackground
        setupViews()
    }
    
    private func setupViews() {
        view.addSubview(tableView)
        view.addSubview(emptyStateLabel)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            emptyStateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emptyStateLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    func updateSearchResults(with query: String) {
        if query.isEmpty {
            filteredClubs = []
        } else {
            filteredClubs = allClubs.filter { club in
                club.name.lowercased().contains(query.lowercased()) ||
                club.league.lowercased().contains(query.lowercased())
            }
        }
        
        emptyStateLabel.isHidden = !filteredClubs.isEmpty || query.isEmpty
        tableView.reloadData()
    }
}

extension SearchResultsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredClubs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ClubSearchCell.identifier, for: indexPath) as? ClubSearchCell else {
            return UITableViewCell()
        }
        
        let club = filteredClubs[indexPath.row]
        cell.configure(with: club)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let club = filteredClubs[indexPath.row]
        delegate?.didSelectClub(club)
    }
}

class ClubSearchCell: UITableViewCell {
    static let identifier = "ClubSearchCell"
    
    private let containerView: UIView = {
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
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .white
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
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let chevronIcon: UIImageView = {
        let iv = UIImageView(image: UIImage(systemName: "chevron.right"))
        iv.tintColor = .lightGray
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        selectionStyle = .none
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(containerView)
        
        let leagueStack = UIStackView(arrangedSubviews: [leagueFlag, leagueLabel])
        leagueStack.axis = .horizontal
        leagueStack.spacing = 6
        leagueStack.alignment = .center
        leagueStack.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(clubLogo)
        containerView.addSubview(clubNameLabel)
        containerView.addSubview(leagueStack)
        containerView.addSubview(chevronIcon)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
            
            clubLogo.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 12),
            clubLogo.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            clubLogo.widthAnchor.constraint(equalToConstant: 50),
            clubLogo.heightAnchor.constraint(equalToConstant: 50),
            
            clubNameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            clubNameLabel.leadingAnchor.constraint(equalTo: clubLogo.trailingAnchor, constant: 12),
            clubNameLabel.trailingAnchor.constraint(equalTo: chevronIcon.leadingAnchor, constant: -8),
            
            leagueStack.topAnchor.constraint(equalTo: clubNameLabel.bottomAnchor, constant: 4),
            leagueStack.leadingAnchor.constraint(equalTo: clubLogo.trailingAnchor, constant: 12),
            leagueStack.trailingAnchor.constraint(lessThanOrEqualTo: chevronIcon.leadingAnchor, constant: -8),
            
            leagueFlag.widthAnchor.constraint(equalToConstant: 18),
            leagueFlag.heightAnchor.constraint(equalToConstant: 18),
            
            chevronIcon.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -12),
            chevronIcon.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            chevronIcon.widthAnchor.constraint(equalToConstant: 12),
            chevronIcon.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func configure(with club: Club) {
        clubLogo.image = UIImage(named: club.logo)
        clubNameLabel.text = club.name
        leagueFlag.image = UIImage(named: club.leagueFlag)
        leagueLabel.text = club.league
    }
}
