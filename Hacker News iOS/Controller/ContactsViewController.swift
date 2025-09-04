//
//  ContactsViewController.swift
//  Hacker News iOS
//
//  Created by Dhathri Bathini on 8/26/25.
//

import UIKit

class ContactsViewController: UIViewController {
    
    //MARK: Properties
    
    let contactsTableView = UITableView()
    let searchBar = UISearchBar()
    var contactsViewModel: ContactsViewModel = ContactsViewModel()
    
    //MARK: View Lifecycle Methods
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegates()
        setupUI()
        buildData()
    }
}

//MARK: TableView DataSource Methods

extension ContactsViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contactsViewModel.getNumberOfRows()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ContactsTableCell") as? ContactsTableCell else {
            return UITableViewCell()
        }
        cell.loadCellData(contact: contactsViewModel.getContact(Row: indexPath.row))
        return cell
    }
}

//MARK: TableView Delegate Methods

extension ContactsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        contactsViewModel.getRowHeight()
    }
}

//MARK: Search Delegate Methods

extension ContactsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        contactsViewModel.applyFilter(searchText)
        contactsTableView.reloadData()
    }
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = nil
        searchBar.resignFirstResponder()
        searchBar.showsCancelButton = false
        contactsViewModel.applyFilter("")
        contactsTableView.reloadData()
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}

//MARK: Helper functions

extension ContactsViewController {
    fileprivate func buildData() {
        contactsTableView.reloadData()
    }
    
    fileprivate func setupDelegates() {
        contactsTableView.dataSource = self
        contactsTableView.delegate = self
        searchBar.delegate = self
    }
    
    func setupUI() {
        view.backgroundColor = .cyan
        title = "Contacts"
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
