//
//  LiveCollectionView.swift
//  Live Score App
//
//  Created by Dashdemirli Enver on 13.09.25.
//

import UIKit
import CoreData

class ScoreCollectionView: UIView {
    
//    private lazy var collectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .vertical
//        layout.minimumLineSpacing = 12
//        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        cv.backgroundColor = .customBackground
//        cv.translatesAutoresizingMaskIntoConstraints = false
//        return cv
//    }()
    
    private let headerCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 12
        layout.minimumInteritemSpacing = 12
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .customBackground
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    private let mainCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 12
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .customBackground
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()

    
    // MARK: - Init
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupCollectionView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupCollectionView()
        setupConstraints()
    }
    
    // MARK: - Setup
    private func setupCollectionView() {
        addSubview(headerCollectionView)
        addSubview(mainCollectionView)
        
        headerCollectionView.dataSource = self
        headerCollectionView.delegate = self
        mainCollectionView.dataSource = self
        mainCollectionView.delegate = self
        
        headerCollectionView.register(
            LiveScoreCell.self,
            forCellWithReuseIdentifier: LiveScoreCell.identifier
        )
        mainCollectionView.register(
            FinalScoreCell.self,
            forCellWithReuseIdentifier: FinalScoreCell.identifier
        )
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            headerCollectionView.topAnchor.constraint(equalTo: topAnchor),
            headerCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            headerCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            headerCollectionView.heightAnchor.constraint(equalToConstant: 200),

            mainCollectionView.topAnchor.constraint(equalTo: headerCollectionView.bottomAnchor, constant: 12),
            mainCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            mainCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            mainCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor)

        ])
    }
}

extension ScoreCollectionView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == headerCollectionView {
            return LiveScoreMatch.mockData.count
        } else if collectionView == mainCollectionView {
            return FinalScoreMatch.mockData.count
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == headerCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LiveScoreCell.identifier,
                                                          for: indexPath) as! LiveScoreCell
            let match = LiveScoreMatch.mockData[indexPath.item]
            cell.configure(with: match)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FinalScoreCell.identifier,
                                                          for: indexPath) as! FinalScoreCell
            let match = FinalScoreMatch.mockData[indexPath.item]
            cell.configure(with: match)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == headerCollectionView {
            return CGSize(width: collectionView.bounds.width - 32, height: 200)
        } else {
            return CGSize(width: collectionView.bounds.width, height: 80)
        }
    }
}
