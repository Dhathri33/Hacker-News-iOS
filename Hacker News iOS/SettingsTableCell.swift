//
//  SettingsTableCell.swift
//  Hacker News iOS
//
//  Created by Dhathri Bathini on 8/25/25.
//
import UIKit

class SettingsTableCell: UITableViewCell {
    static let reuseIdentifier = "SettingsTableCell"
    let iconImageView = UIImageView()
    let titleLabel: UILabel = UILabel()
    let detailLabel: UILabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Helper Functions
    
    func setupUI() {
        accessoryType = .disclosureIndicator
        
        titleLabel.font = UIFont(name: "TimesNewRomanPSMT", size: 18)
        titleLabel.textColor = .label
        
        detailLabel.font = UIFont(name: "TimesNewRomanPSMT", size: 17)
        detailLabel.textColor = .secondaryLabel
        detailLabel.setContentHuggingPriority(.required, for: .horizontal)

        iconImageView.contentMode = .scaleAspectFit
        
        // StackView
        let stackView = UIStackView(arrangedSubviews: [iconImageView, titleLabel, UIView(),detailLabel])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 12
        
        contentView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            iconImageView.widthAnchor.constraint(equalToConstant: 28),
            iconImageView.heightAnchor.constraint(equalToConstant: 28)
        ])
    }

    
}
    

