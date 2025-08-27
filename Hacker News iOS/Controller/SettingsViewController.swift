//
//  SettingsViewController.swift
//  Hacker News iOS
//
//  Created by Dhathri Bathini on 8/25/25.
//

import UIKit

class SettingsViewController: UIViewController {
    
    //MARK: Properties
    
    var settingsRows: [SettingsRow] = []
    var sections: [SettingsSection] = []
    var visibleSections: [SettingsSection] = []
    let settingsTableView = UITableView(frame: .zero, style: .insetGrouped)
    let searchBar = UISearchBar()
    
    //MARK: View Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegates()
        setupUI()
        buildData()
    }
}

//MARK: TableView DataSource Methods

extension SettingsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        visibleSections.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        visibleSections[section].rows.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableCell.reuseIdentifier, for: indexPath) as? SettingsTableCell else {
            return UITableViewCell()
        }
        cell.loadCellData(setting: visibleSections[indexPath.section].rows[indexPath.row])
        return cell
    }
}

//MARK: Search Delegate Methods

extension SettingsViewController: UISearchBarDelegate {
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
}

//MARK: Helper functions

extension SettingsViewController {
    fileprivate func buildData() {
        sections = SettingsSection.sampleData()
        visibleSections = sections
        settingsTableView.reloadData()
    }
    
    private func applyFilter(_ text: String) {
        let query = text.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !query.isEmpty else {
            visibleSections = sections
            settingsTableView.reloadData()
            return
        }
        let lower = query.lowercased()
        visibleSections = sections.compactMap { section in
            let filteredRows = section.rows.filter { row in
                let inTitle = row.title.lowercased().contains(lower)
                return inTitle
            }
            return filteredRows.isEmpty ? nil : SettingsSection(rows: filteredRows)
        }
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
