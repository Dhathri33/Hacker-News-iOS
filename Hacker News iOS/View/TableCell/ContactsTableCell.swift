import UIKit

class ContactsTableCell: UITableViewCell {
    static let reuseIdentifier = "ContactsTableCell"

    let profileImageView = UIImageView()
    let contactNameLabel: UILabel = UILabel()
    let contactTitleLabel: UILabel = UILabel()
    let flagImageView: UIImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        contentView.backgroundColor = selected ? UIColor.cyan : .clear
    }

    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        contentView.backgroundColor = highlighted ? UIColor.cyan: .clear
    }
    
    func setupUI() {
        
        selectionStyle = .none
        
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.layer.cornerRadius = 35
        profileImageView.layer.masksToBounds = true
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.widthAnchor.constraint(equalToConstant: 70).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        contactNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        contactNameLabel.textColor = .label
        
        contactTitleLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        contactTitleLabel.textColor = .white
        contactTitleLabel.backgroundColor = UIColor.systemTeal
        contactTitleLabel.layer.cornerRadius = 6
        contactTitleLabel.layer.masksToBounds = true
        contactTitleLabel.textAlignment = .center
        contactTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        flagImageView.contentMode = .scaleAspectFit
        flagImageView.translatesAutoresizingMaskIntoConstraints = false
        flagImageView.layer.cornerRadius = 14
        flagImageView.layer.masksToBounds = true
        flagImageView.widthAnchor.constraint(equalToConstant: 28).isActive = true
        flagImageView.heightAnchor.constraint(equalToConstant: 28).isActive = true

        let textStack = UIStackView(arrangedSubviews: [contactNameLabel, contactTitleLabel])
        textStack.axis = .vertical
        textStack.spacing = 4
        textStack.alignment = .leading
        
        let stackView = UIStackView(arrangedSubviews: [profileImageView, textStack, UIView(), flagImageView])
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
            
            contactTitleLabel.heightAnchor.constraint(equalToConstant: 22)
        ])
        
    }
}
