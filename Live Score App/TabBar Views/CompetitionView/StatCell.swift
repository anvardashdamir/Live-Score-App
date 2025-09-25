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
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let playerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let clubLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let labelsStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let playerImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let goalLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .dotColour
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
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true
        
        contentView.backgroundColor = .cellColour
        contentView.addSubview(rankLabel)
        contentView.addSubview(playerImage)
        contentView.addSubview(labelsStack)
        contentView.addSubview(goalLabel)
        
        labelsStack.addArrangedSubview(playerLabel)
        labelsStack.addArrangedSubview(clubLabel)
                
        NSLayoutConstraint.activate([
            rankLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            rankLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            rankLabel.widthAnchor.constraint(equalToConstant: 24),
            
            playerImage.leadingAnchor.constraint(equalTo: rankLabel.trailingAnchor, constant: 8),
            playerImage.centerYAnchor.constraint(equalTo: rankLabel.centerYAnchor),
            playerImage.widthAnchor.constraint(equalToConstant: 32),
            playerImage.heightAnchor.constraint(equalToConstant: 32),
            
            labelsStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            labelsStack.leadingAnchor.constraint(equalTo: playerImage.trailingAnchor, constant: 8),
            labelsStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
            labelsStack.widthAnchor.constraint(lessThanOrEqualToConstant: 140),
            
            goalLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            goalLabel.centerYAnchor.constraint(equalTo: playerImage.centerYAnchor),
        ])
    }
}

extension StatCell {
    func configure(with stat: PlayerStat, rank: Int) {
        rankLabel.text = "\(rank)"
        playerLabel.text = stat.playerName
        goalLabel.text = "\(stat.goals)"
        playerImage.image = stat.playerPhoto
        clubLabel.text = stat.team
        
        rankLabel.textColor = UIColor(red: 182/255, green: 182/255, blue: 182/255, alpha: 1)
    }
    
    func applyCornerMask(for indexPath: IndexPath, totalItems: Int) {
        contentView.layer.cornerRadius = 0
        contentView.layer.maskedCorners = []
        
        if indexPath.item == 0 {
            // first → top left + top right
            contentView.layer.cornerRadius = 10
            contentView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        } else if indexPath.item == totalItems - 1 {
            // last → bottom left + bottom right
            contentView.layer.cornerRadius = 10
            contentView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        }
    }
    
}
