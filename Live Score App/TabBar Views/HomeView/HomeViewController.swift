//
//  HomeViewController.swift
//  Live Score App
//
//  Created by Dashdemirli Enver on 13.09.25.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let topSectionView = TopSectionView()
    private let liveNowSection = LiveNowSection()
    private let scrollCollectionView = ScoreCollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .customBackground
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(topSectionView)
        view.addSubview(liveNowSection)
        view.addSubview(scrollCollectionView)
        
        topSectionView.translatesAutoresizingMaskIntoConstraints = false
        liveNowSection.translatesAutoresizingMaskIntoConstraints = false
        scrollCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            topSectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topSectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            topSectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            topSectionView.heightAnchor.constraint(equalToConstant: 40),
            
            liveNowSection.topAnchor.constraint(equalTo: topSectionView.bottomAnchor, constant: 12),
            liveNowSection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            liveNowSection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            liveNowSection.heightAnchor.constraint(equalToConstant: 20),

            
            scrollCollectionView.topAnchor.constraint(equalTo: liveNowSection.bottomAnchor, constant: 12),
            scrollCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)

        ])
    }
}



