//
//  StatCell.swift
//  Live Score App
//
//  Created by Dashdemirli Enver on 22.09.25.
//

import UIKit

class StatCell: UICollectionViewCell {
    static let identifier = "StatCell"

    let rankLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .lightGray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let playerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .lightGray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let playerImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let goalLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .lightGray
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
        contentView.backgroundColor = .customBackground
        contentView.layer.cornerRadius = 10
        contentView.clipsToBounds = true

        contentView.addSubview(rankLabel)
        contentView.addSubview(playerImage)
        contentView.addSubview(playerLabel)
        contentView.addSubview(goalLabel)

        // Constraints
        NSLayoutConstraint.activate([
            // Rank Label
            rankLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            rankLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            rankLabel.widthAnchor.constraint(equalToConstant: 24),

            // Color Indicator View
            playerImage.leadingAnchor.constraint(equalTo: rankLabel.trailingAnchor, constant: 4),
            playerImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            playerImage.widthAnchor.constraint(equalToConstant: 15),
            playerImage.heightAnchor.constraint(equalToConstant: 15),

            // Club Label
            playerLabel.leadingAnchor.constraint(equalTo: playerImage.trailingAnchor, constant: 8),
            playerLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            playerLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 120),

            goalLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            goalLabel.centerYAnchor.constraint(equalTo: playerImage.centerYAnchor),
        ])
    }
}

extension StatCell {
    func configure(with stat: PlayerStat, rank: Int) {
        rankLabel.text = "\(rank)"
        playerLabel.text = stat.playerName
        goalLabel.text = "\(stat.goals)"
        playerImage.image = UIImage(named: "englandFlag")
        
        rankLabel.textColor = rank <= 3 ? .systemYellow : .white
        if rank < 50 { // Example threshold
            rankLabel.textColor = .systemRed // Adjust to match your specific reds
        } else {
            rankLabel.textColor = .white
        }
    }
}
