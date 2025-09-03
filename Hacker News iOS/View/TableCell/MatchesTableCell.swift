//
//  MatchesTableCell.swift
//  Hacker News iOS
//
//  Created by Dhathri Bathini on 9/3/25.
//
import UIKit

class MatchesTableCell: UITableViewCell {
    static let reuseIdentifier = "MatchesTableCell"
    
    let leftDateStack = UIStackView()
    let dayLabel = UILabel()
    let timeLabel = UILabel()
    let timeZoneLabel = UILabel()
    
    private let titleStack = UIStackView()
    private let line1 = UILabel()
    private let line2 = UILabel()
    private let bellImage = UIImageView()
    
    //MARK: Initializers for UITableViewCell
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        dayLabel.text = nil
        timeLabel.text = nil
        timeZoneLabel.text = nil
        line1.text = nil
        line2.text = nil
    }
}

//MARK: Helper Functions

extension MatchesTableCell {
    func setupUI() {
        backgroundColor = .clear
        contentView.backgroundColor = .white
  
        leftDateStack.axis = .vertical
        leftDateStack.alignment = .leading
        leftDateStack.spacing = 2
        leftDateStack.translatesAutoresizingMaskIntoConstraints = false
        
        dayLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        dayLabel.textColor = .secondaryLabel
        
        timeZoneLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        timeZoneLabel.textColor = .secondaryLabel
        
        timeLabel.font = .systemFont(ofSize: 22, weight: .semibold)
        
        leftDateStack.addArrangedSubview(dayLabel)
        leftDateStack.addArrangedSubview(timeLabel)
        leftDateStack.addArrangedSubview(timeZoneLabel)
        
        titleStack.axis = .vertical
        titleStack.alignment = .leading
        titleStack.spacing = 6
        titleStack.translatesAutoresizingMaskIntoConstraints = false
        
        line1.font = .systemFont(ofSize: 20, weight: .semibold)
        line2.font = .systemFont(ofSize: 20, weight: .regular)
        
        titleStack.addArrangedSubview(line1)
        titleStack.addArrangedSubview(line2)
 
        bellImage.contentMode = .scaleAspectFit
        bellImage.translatesAutoresizingMaskIntoConstraints = false
        bellImage.layer.cornerRadius = 14
        bellImage.layer.masksToBounds = true
        bellImage.tintColor = .systemGray
        
        let spacer = UIView()
        spacer.translatesAutoresizingMaskIntoConstraints = false
        spacer.setContentHuggingPriority(.defaultLow, for: .horizontal)
        
        let h = UIStackView(arrangedSubviews: [leftDateStack, titleStack, spacer, bellImage])
        h.axis = .horizontal
        h.alignment = .center
        h.spacing = 16
        h.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(h)
        
        NSLayoutConstraint.activate([
            bellImage.widthAnchor.constraint(equalToConstant: 28),
            bellImage.heightAnchor.constraint(equalToConstant: 28),
            h.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            h.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            h.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            h.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ])
    }
    
    func loadCellData(match: MatchRow) {
        dayLabel.text = match.dateWeekDay
        timeLabel.text = match.time
        timeZoneLabel.text = match.timeZone
        line1.text = match.homeCity
        line2.text = match.sportsClub
        bellImage.image = UIImage(systemName: "bell.fill")
    }
}
