//
//  CompetitionDetailPage.swift
//  Live Score App
//
//  Created by Dashdemirli Enver on 22.09.25.
//

import UIKit

class CompetitionDetailPage: UIViewController {
        
    private var results: [MatchResult] = []
    private var fixtures: [Fixture] = []
    private var standings: [Standing] = []
    private var stats: [PlayerStat] = []

    private let countryPhoto: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "englandFlag")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let countryName: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "England"
        return label
    }()

    private let leagueName: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "PREMIER LEAGUE"
        return label
    }()
    
    private var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 12
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .customBackground
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    private var selectedTab: Tab = .results
    
    enum Tab: Int, CaseIterable {
        case results, fixtures, standings, stats
        
        var title: String {
            switch self {
            case .results: return "Results"
            case .fixtures: return "Fixtures"
            case .standings: return "Standings"
            case .stats: return "Stats"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        view.backgroundColor = .customBackground
        title = "Competition"
        
        let titleTextAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.white]
        if let navigationController = self.navigationController { navigationController.navigationBar.titleTextAttributes = titleTextAttributes}
        
        setupUI()
        setupCollectionView()
        
        results = MatchResult.mock
        fixtures = Fixture.mock
        standings = Standing.mock
        stats = PlayerStat.mock
    }
    
    private func setupUI() {
        view.addSubview(countryPhoto)
        view.addSubview(countryName)
        view.addSubview(leagueName)
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            countryPhoto.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            countryPhoto.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            countryPhoto.heightAnchor.constraint(equalToConstant: 50),
            countryPhoto.widthAnchor.constraint(equalToConstant: 50),
            
            countryName.topAnchor.constraint(equalTo: countryPhoto.bottomAnchor, constant: 12),
            countryName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            leagueName.topAnchor.constraint(equalTo: countryName.bottomAnchor, constant: 12),
            leagueName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            collectionView.topAnchor.constraint(equalTo: leagueName.bottomAnchor, constant: 12),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupCollectionView() {
        
        collectionView.register(ResultsCell.self, forCellWithReuseIdentifier: ResultsCell.identifier)
        collectionView.register(FixtureCell.self, forCellWithReuseIdentifier: FixtureCell.identifier)
        collectionView.register(StandingsCell.self, forCellWithReuseIdentifier: StandingsCell.identifier)
        collectionView.register(StatCell.self, forCellWithReuseIdentifier: StatCell.identifier)
        
        collectionView.register(
            SegmentedHeaderView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: SegmentedHeaderView.identifier
        )
    }

}

class SegmentedHeaderView: UICollectionReusableView {
    static let identifier = "SegmentedHeaderView"
    
    private let segmentedControl: UISegmentedControl = {
        let control = UISegmentedControl(items: CompetitionDetailPage.Tab.allCases.map { $0.title })
        control.selectedSegmentIndex = 0
        return control
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(segmentedControl)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.backgroundColor = .clear
        segmentedControl.selectedSegmentTintColor = .dotColour
        
        let selectedTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        segmentedControl.setTitleTextAttributes(selectedTextAttributes, for: .selected)

        let normalTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 93/255, green: 92/255, blue: 100/255, alpha: 1)]
        segmentedControl.setTitleTextAttributes(normalTextAttributes, for: .normal)
        
        NSLayoutConstraint.activate([
            segmentedControl.centerXAnchor.constraint(equalTo: centerXAnchor),
            segmentedControl.centerYAnchor.constraint(equalTo: centerYAnchor),
            segmentedControl.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9)
        ])
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    func configure(action: @escaping (Int) -> Void) {
        segmentedControl.addAction(UIAction { [weak self] _ in
            action(self?.segmentedControl.selectedSegmentIndex ?? 0)
        }, for: .valueChanged)
    }
}


extension CompetitionDetailPage: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch selectedTab {
        case .results: return results.count
        case .fixtures: return fixtures.count
        case .standings: return standings.count
        case .stats: return stats.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch selectedTab {
        case .results:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ResultsCell.identifier,
                for: indexPath
            ) as! ResultsCell
            cell.configure(with: results[indexPath.item])
            return cell
            
        case .fixtures:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: FixtureCell.identifier,
                for: indexPath
            ) as! FixtureCell
            cell.configure(with: fixtures[indexPath.item])
            return cell
            
        case .standings:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: StandingsCell.identifier,
                for: indexPath
            ) as! StandingsCell
            cell.configure(with: standings[indexPath.item])
            return cell
            
        case .stats:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: StatCell.identifier,
                for: indexPath
            ) as! StatCell
            cell.configure(with: stats[indexPath.item], rank: indexPath.item + 1)
            return cell
        }
    }
    
    // MARK: - Header & Layout
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                     withReuseIdentifier: SegmentedHeaderView.identifier,
                                                                     for: indexPath) as! SegmentedHeaderView
        header.configure { [weak self] index in
            self?.selectedTab = CompetitionDetailPage.Tab(rawValue: index) ?? .results
            self?.collectionView.reloadData()
        }
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch selectedTab {
        case .results, .fixtures, .stats:
            return CGSize(width: collectionView.frame.width, height: 80)
        case .standings:
            return CGSize(width: collectionView.frame.width, height: 32)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 50)
    }

    
    
}

