//
//  SettingsViewController.swift
//  Hacker News iOS
//
//  Created by Dhathri Bathini on 8/25/25.
//

import UIKit

class SettingsViewController: UIViewController {
    
    //MARK: Properties
    
    let settingsTableView = UITableView(frame: .zero, style: .insetGrouped)
    let searchBar = UISearchBar()
    var settingsViewModel: SettingsViewModel = SettingsViewModel()
    
    //MARK: View Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegates()
        setupUI()
        reloadData()
    }
}

//MARK: TableView DataSource Methods

extension SettingsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        settingsViewModel.getNumberOfSections()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        settingsViewModel.getNumberOfRows(in: section)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableCell.reuseIdentifier, for: indexPath) as? SettingsTableCell else {
            return UITableViewCell()
        }
        cell.loadCellData(setting: settingsViewModel.getRow(section: indexPath.section, row: indexPath.row))
        return cell
    }
}

//MARK: Search Delegate Methods

extension SettingsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        settingsViewModel.applyFilter(searchText)
        reloadData()
    }
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = nil
        searchBar.resignFirstResponder()
        searchBar.showsCancelButton = false
        settingsViewModel.applyFilter("")
        reloadData()
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}

//MARK: Helper functions

extension SettingsViewController {
    fileprivate func reloadData() {
        settingsTableView.reloadData()
    }
    
    fileprivate func setupDelegates() {
        settingsTableView.dataSource = self
        searchBar.delegate = self
    }
    
    func setupUI() {
        view.backgroundColor = .systemBackground
        title = "Settings"
        searchBar.placeholder = "Search"
        searchBar.sizeToFit()
        settingsTableView.tableHeaderView = searchBar
        settingsTableView.translatesAutoresizingMaskIntoConstraints = false
        settingsTableView.register(SettingsTableCell.self, forCellReuseIdentifier: SettingsTableCell.reuseIdentifier)
        view.addSubview(settingsTableView)
        NSLayoutConstraint.activate([
            settingsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 4),
            settingsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -4),
            settingsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 4),
            settingsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -4)
        ])
    }
}
