//
//  ContactsViewController.swift
//  Hacker News iOS
//
//  Created by Dhathri Bathini on 8/26/25.
//

import UIKit

struct ContactsRow {
    let profileImage: String
    let contactName: String
    let contactTitle: String
    let flagImage: String
}

class ContactsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    var contactsRow: [ContactsRow] = []
    var visibleContacts: [ContactsRow] = []
    let contactsTableView = UITableView()
    let searchBar = UISearchBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Contacts"
        
        contactsTableView.dataSource = self
        contactsTableView.delegate = self
        searchBar.delegate = self
        
        setupUI()
        
        let objContactsRows1: ContactsRow = ContactsRow(profileImage: "profilem1", contactName: "Mohammad Hussain", contactTitle: "SEO Specialist", flagImage: "flag1")
        let objContactsRows2: ContactsRow = ContactsRow(profileImage: "profilem2", contactName: "John Young", contactTitle: "Interactive Designer", flagImage: "flag2")
        let objContactsRows3: ContactsRow = ContactsRow(profileImage: "profilew1", contactName: "Tamilarasi Mohan", contactTitle: "Architect", flagImage: "flag3")
        let objContactsRows4: ContactsRow = ContactsRow(profileImage: "profilew2", contactName: "Kim Yu", contactTitle: "Economist", flagImage: "flag4")
        let objContactsRows5: ContactsRow = ContactsRow(profileImage: "profilem3", contactName: "Derek Fowler", contactTitle: "Web Strategist", flagImage: "flag5")
        let objContactsRows6: ContactsRow = ContactsRow(profileImage: "profilew3", contactName: "Shreya Nithin", contactTitle: "Product Designer", flagImage: "flag6")
        let objContactsRows7: ContactsRow = ContactsRow(profileImage: "profilew4", contactName: "Emily Adams", contactTitle: "Editor", flagImage: "flag7")

        contactsRow.append(objContactsRows1)
        contactsRow.append(objContactsRows2)
        contactsRow.append(objContactsRows3)
        contactsRow.append(objContactsRows4)
        contactsRow.append(objContactsRows5)
        contactsRow.append(objContactsRows6)
        contactsRow.append(objContactsRows7)
        
        visibleContacts = contactsRow
        contactsTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        visibleContacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ContactsTableCell") as? ContactsTableCell else {
            return UITableViewCell()
        }
        let row = visibleContacts[indexPath.row]
        cell.profileImageView.image = UIImage(named: row.profileImage)
        cell.contactNameLabel.text = row.contactName
        cell.contactTitleLabel.text = row.contactTitle
        cell.flagImageView.image = UIImage(named: row.flagImage)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        105
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        applyFilter(searchText)
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = nil
        searchBar.resignFirstResponder()
        searchBar.showsCancelButton = false
        applyFilter("")
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    private func applyFilter(_ text: String) {
        let query = text.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !query.isEmpty else {
            visibleContacts = contactsRow
            contactsTableView.reloadData()
            return
        }

        visibleContacts = contactsRow.filter {
            $0.contactName.range(of: query, options: [.caseInsensitive, .diacriticInsensitive]) != nil
        }

        contactsTableView.reloadData()
    }
    
    func setupUI() {
        
        view.backgroundColor = .cyan
        
        searchBar.placeholder = "Search"
        searchBar.sizeToFit()
        contactsTableView.tableHeaderView = searchBar
        
        contactsTableView.translatesAutoresizingMaskIntoConstraints = false
        contactsTableView.register(ContactsTableCell.self, forCellReuseIdentifier: ContactsTableCell.reuseIdentifier)
        view.addSubview(contactsTableView)
        
        NSLayoutConstraint.activate([
            contactsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            contactsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            contactsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 4),
            contactsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
        
    }
}
