//
//  HomeViewController.swift
//  Live Score App
//
//  Created by Dashdemirli Enver on 13.09.25.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let topSectionView = TopSectionView()
    private let scrollCollectionView = ScoreCollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .customBackground
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(topSectionView)
        view.addSubview(scrollCollectionView)
        
        topSectionView.translatesAutoresizingMaskIntoConstraints = false
        scrollCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topSectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topSectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            topSectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            topSectionView.heightAnchor.constraint(equalToConstant: 80),
            
            scrollCollectionView.topAnchor.constraint(equalTo: topSectionView.bottomAnchor, constant: 6),
            scrollCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            scrollCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            scrollCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

