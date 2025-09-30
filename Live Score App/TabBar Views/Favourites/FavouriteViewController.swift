//
//  NewsViewController.swift
//  Live Score App
//
//  Created by Dashdemirli Enver on 13.09.25.
//

import UIKit

class FavouriteViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
        
    private var favouriteClubs: [Club] = []
    
    private let tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = .clear
        return tv
    }()
    
    private let emptyLabel: UILabel = {
        let label = UILabel()
        label.text = "⭐ No favourites yet"
        label.textColor = .lightGray
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .customBackground
        title = "Favourites"
        
        view.addSubview(tableView)
        view.addSubview(emptyLabel)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.frame = view.bounds
        setupUI()
    }
    
    func setupUI() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            emptyLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emptyLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadFavourites()
    }
    
    private func loadFavourites() {
        let defaults = UserDefaults.standard
        let savedIDs = defaults.stringArray(forKey: "favouriteClubIDs") ?? []
        
        favouriteClubs = Club.mockClubs.filter { savedIDs.contains($0.id) }
        
        emptyLabel.isHidden = !favouriteClubs.isEmpty
        tableView.reloadData()
    }
    
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return favouriteClubs.count
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let club = favouriteClubs[indexPath.row]
          let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
          cell.textLabel?.text = "⭐ \(club.name)"
          cell.textLabel?.textColor = .white
          cell.backgroundColor = .clear
          return cell
      }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let club = favouriteClubs[indexPath.row]
        let detailVC = ClubDetailViewController(club: club)
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
       func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
           if editingStyle == .delete {
               favouriteClubs.remove(at: indexPath.row)
               UserDefaults.standard.set(favouriteClubs, forKey: "favouriteClubIDs")
               tableView.deleteRows(at: [indexPath], with: .fade)
           }
       }

}

    
    

