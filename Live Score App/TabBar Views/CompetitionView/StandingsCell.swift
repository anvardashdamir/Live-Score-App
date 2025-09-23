//
//  StandingsCell.swift
//  Live Score App
//
//  Created by Dashdemirli Enver on 22.09.25.
//

import UIKit

class StandingsCell: UICollectionViewCell {
    static let identifier = "StandingsCell"

    let rankLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .lightGray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let colorIndicatorView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 2
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let clubLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let plLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .lightGray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let wLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .lightGray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let dLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .lightGray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let lLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .lightGray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let gdLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .lightGray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let ptsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = .red
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        contentView.backgroundColor = UIColor(white: 0.12, alpha: 1.0)
        contentView.layer.cornerRadius = 8
        contentView.clipsToBounds = true

        contentView.addSubview(rankLabel)
        contentView.addSubview(colorIndicatorView)
        contentView.addSubview(clubLabel)
        contentView.addSubview(plLabel)
        contentView.addSubview(wLabel)
        contentView.addSubview(dLabel)
        contentView.addSubview(lLabel)
        contentView.addSubview(gdLabel)
        contentView.addSubview(ptsLabel)

        // Constraints
        NSLayoutConstraint.activate([
            // Color Indicator View
            colorIndicatorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            colorIndicatorView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            colorIndicatorView.widthAnchor.constraint(equalToConstant: 2),
            colorIndicatorView.heightAnchor.constraint(equalToConstant: 30),
            
            // Rank Label
            rankLabel.leadingAnchor.constraint(equalTo: colorIndicatorView.trailingAnchor, constant: 4),
            rankLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            rankLabel.widthAnchor.constraint(equalToConstant: 24),

            // Club Label
            clubLabel.leadingAnchor.constraint(equalTo: rankLabel.trailingAnchor, constant: 4),
            clubLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            clubLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 124),

            // Stats Labels (PL, W, D, L, GD, PTS)
            // Distribute these evenly towards the right side
            ptsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4),
            ptsLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            ptsLabel.widthAnchor.constraint(equalToConstant: 30),

            gdLabel.trailingAnchor.constraint(equalTo: ptsLabel.leadingAnchor, constant: -4),
            gdLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            gdLabel.widthAnchor.constraint(equalToConstant: 30),

            lLabel.trailingAnchor.constraint(equalTo: gdLabel.leadingAnchor, constant: -4),
            lLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            lLabel.widthAnchor.constraint(equalToConstant: 30),

            dLabel.trailingAnchor.constraint(equalTo: lLabel.leadingAnchor, constant: -4),
            dLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            dLabel.widthAnchor.constraint(equalToConstant: 30),

            wLabel.trailingAnchor.constraint(equalTo: dLabel.leadingAnchor, constant: -4),
            wLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            wLabel.widthAnchor.constraint(equalToConstant: 30),

            plLabel.trailingAnchor.constraint(equalTo: wLabel.leadingAnchor, constant: -4),
            plLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            plLabel.widthAnchor.constraint(equalToConstant: 30),
        ])
    }
}

extension StandingsCell {
    func configure(with standing: Standing, indicatorColor: UIColor? = nil) {
        rankLabel.text = "\(standing.position)"
        clubLabel.text = standing.clubName
        
        plLabel.text = "\(standing.played)"
        wLabel.text = "\(standing.wins)"
        dLabel.text = "\(standing.draws)"
        lLabel.text = "\(standing.losses)"
        
        gdLabel.text = "\(standing.wins - standing.losses)"
        ptsLabel.text = "\(standing.points)"
        
        colorIndicatorView.backgroundColor = .red
        if standing.position < 5 {
            colorIndicatorView.backgroundColor = UIColor(red: 75/255, green: 142/255, blue: 242/255, alpha: 1)
        } else if standing.position < 7 {
            colorIndicatorView.backgroundColor = UIColor(red: 233/255, green: 111/255, blue: 50/255, alpha: 1)
        } else if standing.position == 7 {
            colorIndicatorView.backgroundColor = UIColor(red: 84/255, green: 180/255, blue: 113/255, alpha: 1)
        } else {
            colorIndicatorView.backgroundColor = .clear
        }
        
        ptsLabel.textColor = .systemRed
    }
}
