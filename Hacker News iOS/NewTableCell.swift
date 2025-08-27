//
//  NewTableCell.swift
//  Hacker News iOS
//
//  Created by Dhathri Bathini on 8/22/25.
//

import UIKit

class NewTableCell: UITableViewCell {
    
    static let reuseIdentifier = "NewTableCell"
    
    let titleLabel = UILabel()
    let postDetailsLabel = UILabel()
    let pointsImageView = UIImageView(image: UIImage(systemName: "clock"))
    let pointsLabel = UILabel()
    let commentsImageView = UIImageView(image: UIImage(systemName: "ellipsis.message"))
    let commentsLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        backgroundColor = .black
        accessoryType = .disclosureIndicator
        
        titleLabel.font = UIFont(name: "TimesNewRomanPSMT", size: 20)
        titleLabel.textColor = .white
        titleLabel.numberOfLines = 0
        
        postDetailsLabel.font = UIFont(name: "TimesNewRomanPSMT", size: 17)
        postDetailsLabel.textColor = .lightGray
        
        pointsLabel.font = .systemFont(ofSize: 17)
        pointsLabel.textColor = .systemBlue
        
        pointsImageView.contentMode = .scaleAspectFit
        pointsImageView.tintColor = .systemBlue
        
        commentsLabel.font = .systemFont(ofSize: 17)
        commentsLabel.textColor = .systemOrange
        
        commentsImageView.contentMode = .scaleAspectFit
        commentsImageView.tintColor = .systemOrange
        
        let bottomRow = UIStackView(arrangedSubviews: [pointsImageView, pointsLabel, commentsImageView, commentsLabel])
        bottomRow.axis = .horizontal
        bottomRow.distribution = .fillProportionally
        bottomRow.alignment = .leading
        bottomRow.spacing = 1
        bottomRow.setCustomSpacing(1, after: pointsImageView)
        bottomRow.setCustomSpacing(1, after: commentsImageView)

        let vStack = UIStackView(arrangedSubviews: [titleLabel, postDetailsLabel, bottomRow])
        vStack.axis = .vertical
        vStack.spacing = 8
        vStack.translatesAutoresizingMaskIntoConstraints = false
        vStack.setCustomSpacing(10, after: titleLabel)

        contentView.addSubview(vStack)
        NSLayoutConstraint.activate([
            vStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            vStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            vStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            vStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0)
        ])
    }
}
