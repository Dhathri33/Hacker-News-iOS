//
//  TeamHeaderView.swift
//  Hacker News iOS
//
//  Created by Dhathri Bathini on 9/3/25.
//

import UIKit

final class TeamHeaderView: UITableViewHeaderFooterView {
    static let reuseID = "TeamHeaderView"
    
    private let crestView = UIImageView()
    private let titleLabel = UILabel()
    private let relativeLabel = UILabel()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        contentView.backgroundColor = .white
        
        crestView.translatesAutoresizingMaskIntoConstraints = false
        crestView.contentMode = .scaleAspectFit
        crestView.backgroundColor = .systemGray5
        
        titleLabel.font = .systemFont(ofSize: 22, weight: .semibold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        relativeLabel.font = .systemFont(ofSize: 16, weight: .regular)
        relativeLabel.textColor = .secondaryLabel
        relativeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let spacer = UIView()
        spacer.translatesAutoresizingMaskIntoConstraints = false
        spacer.setContentHuggingPriority(.defaultLow, for: .horizontal)
        let h = UIStackView(arrangedSubviews: [crestView, titleLabel, spacer, relativeLabel])
        h.axis = .horizontal
        h.alignment = .center
        h.spacing = 12
        h.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(h)
        NSLayoutConstraint.activate([
            crestView.widthAnchor.constraint(equalToConstant: 28),
            crestView.heightAnchor.constraint(equalToConstant: 28),
            
            h.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            h.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            h.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            h.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ])
    }
    
    func configure(crestName: String, teamName: String, relativeText: String) {
        if let image = UIImage(named: crestName) {
            crestView.image = image
        } else {
            crestView.image = UIImage(systemName: "flag.fill")
        }
        titleLabel.text = teamName
        relativeLabel.text = relativeText
    }
}
