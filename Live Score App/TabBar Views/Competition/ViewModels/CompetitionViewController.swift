//
//  CompetitionView.swift
//  Live Score App
//
//  Created by Dashdemirli Enver on 13.09.25.
//

import UIKit

final class CompetitionViewController: UIViewController {
    
    private let searchBar: SearchBar = {
        let sb = SearchBar()
        sb.translatesAutoresizingMaskIntoConstraints = false
        return sb
    }()
    
    private let searchResultsContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .customBackground
        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let browseLabel: UILabel = {
        let label = UILabel()
        label.text = "Browse Competition"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let tableView: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = .customBackground
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
        
    private var searchResultsVC: SearchResultsViewController?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .customBackground
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        setupTableView()
        setupSearchResults()
        setupUI()
        searchBar.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CountryCell.self, forCellReuseIdentifier: CountryCell.identifier)
    }
    
    private func setupSearchResults() {
        let resultsVC = SearchResultsViewController()
        resultsVC.delegate = self
        addChild(resultsVC)
        searchResultsContainer.addSubview(resultsVC.view)
        
        resultsVC.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            resultsVC.view.topAnchor.constraint(equalTo: searchResultsContainer.topAnchor),
            resultsVC.view.leadingAnchor.constraint(equalTo: searchResultsContainer.leadingAnchor),
            resultsVC.view.trailingAnchor.constraint(equalTo: searchResultsContainer.trailingAnchor),
            resultsVC.view.bottomAnchor.constraint(equalTo: searchResultsContainer.bottomAnchor)
        ])
        
        resultsVC.didMove(toParent: self)
        searchResultsVC = resultsVC
    }
    
    private func setupUI() {
        view.addSubview(browseLabel)
        view.addSubview(searchBar)
        view.addSubview(tableView)
        view.addSubview(searchResultsContainer)
        
        NSLayoutConstraint.activate([
            browseLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            browseLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            searchBar.topAnchor.constraint(equalTo: browseLabel.bottomAnchor, constant: 8),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            searchBar.heightAnchor.constraint(equalToConstant: 36),
            
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 12),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            searchResultsContainer.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 8),
            searchResultsContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchResultsContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            searchResultsContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension CompetitionViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(
                withIdentifier: CountryCell.identifier,
                for: indexPath
            ) as? CountryCell
        else {
            return UITableViewCell()
        }
        
        let country = countries[indexPath.row]
        cell.configure(with: country)
        cell.accessoryType = .disclosureIndicator
        cell.backgroundColor = .customBackground
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        64
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let country = countries[indexPath.row].countryName
        let viewController: UIViewController
        
        if country == "England" {
            viewController = CompetitionDetailViewController()
        } else {
            viewController = EmptyStateViewController()
        }
        
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension CompetitionViewController: SearchBarDelegate {
    func searchBar(_ searchBar: SearchBar, didChangeText text: String) {
        searchResultsVC?.updateSearchResults(with: text)
    }
    
    func searchBarDidBeginEditing(_ searchBar: SearchBar) {
        searchResultsContainer.isHidden = false
    }
    
    func searchBarDidEndEditing(_ searchBar: SearchBar) {
        if searchBar.textField.text?.isEmpty ?? true {
            searchResultsContainer.isHidden = true
        }
    }
}

extension CompetitionViewController: SearchResultsDelegate {
    func didSelectClub(_ club: Club) {
        searchBar.textField.resignFirstResponder()
        
        let clubDetailVC = ClubDetailViewController(club: club)
        navigationController?.pushViewController(clubDetailVC, animated: true)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { [weak self] in
            self?.searchBar.clearText()
            self?.searchResultsContainer.isHidden = true
        }
    }
}

