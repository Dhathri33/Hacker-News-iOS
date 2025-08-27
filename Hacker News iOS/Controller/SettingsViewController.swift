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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Settings"
        settingsTableView.dataSource = self
        searchBar.delegate = self
        setupUI()
        let objSettingsRows1: SettingsRow = SettingsRow(icon:  "airplane.circle.fill", title: "Airplane Mode", kind: .toggle(isOn: false))
        let objSettingsRows2: SettingsRow = SettingsRow(icon:  "wifi", title: "Wi-Fi", detail: "Mikasa", kind: .disclosure)
        let objSettingsRows3: SettingsRow = SettingsRow(icon:  "beats.studiobuds.plus.chargingcase.fill", title: "Bluetooth", detail: "On", kind: .disclosure)
        let objSettingsRows4: SettingsRow = SettingsRow(icon:  "antenna.radiowaves.left.and.right.circle.fill", title: "Cellular", kind: .disclosure)
        let objSettingsRow5: SettingsRow = SettingsRow(icon:  "personalhotspot.circle.fill", title: "Personal Hotspot", detail: "Off", kind: .disclosure)
        let objSettingsRow6: SettingsRow = SettingsRow(icon:  "battery.100.circle.fill", title: "Battery", kind: .disclosure)
        settingsRows.append(objSettingsRows1)
        settingsRows.append(objSettingsRows2)
        settingsRows.append(objSettingsRows3)
        settingsRows.append(objSettingsRows4)
        settingsRows.append(objSettingsRow5)
        settingsRows.append(objSettingsRow6)
        let objSettingsSection1: SettingsSection = SettingsSection(rows: settingsRows)
        sections.append(objSettingsSection1)
        let objSettingsRows7: SettingsRow = SettingsRow(icon:  "gearshape.fill", title: "General", kind: .disclosure)
        let objSettingsRows8: SettingsRow = SettingsRow(icon:  "accessibility", title: "Accessibility", kind: .disclosure)
        let objSettingsRows9: SettingsRow = SettingsRow(icon:  "hand.tap", title: "Action Button", kind: .disclosure)
        let objSettingsRows10: SettingsRow = SettingsRow(icon:  "apple.intelligence", title: "Apple Intelligence & Siri", kind: .disclosure)
        let objSettingsRow11: SettingsRow = SettingsRow(icon:  "camera.fill", title: "Camera",  kind: .disclosure)
        let objSettingsRow12: SettingsRow = SettingsRow(icon:  "switch.2", title: "Control Center", kind: .disclosure)
        let objSettingsRows13: SettingsRow = SettingsRow(icon:  "sun.max.circle.fill", title: "Display & Brightness", kind: .disclosure)
        let objSettingsRows14: SettingsRow = SettingsRow(icon:  "apps.iphone", title: "Home Screen & App Library", kind: .disclosure)
        let objSettingsRows15: SettingsRow = SettingsRow(icon:  "magnifyingglass", title: "Search", kind: .disclosure)
        let objSettingsRow16: SettingsRow = SettingsRow(icon:  "display", title: "StandBy",  kind: .disclosure)
        let objSettingsRow17: SettingsRow = SettingsRow(icon:  "photo.on.rectangle", title: "Wallpaper", kind: .disclosure)
        settingsRows = []
        settingsRows.append(objSettingsRows7)
        settingsRows.append(objSettingsRows8)
        settingsRows.append(objSettingsRows9)
        settingsRows.append(objSettingsRows10)
        settingsRows.append(objSettingsRow11)
        settingsRows.append(objSettingsRow12)
        settingsRows.append(objSettingsRows13)
        settingsRows.append(objSettingsRows14)
        settingsRows.append(objSettingsRows15)
        settingsRows.append(objSettingsRow16)
        settingsRows.append(objSettingsRow17)
        let objSettingsSection2: SettingsSection = SettingsSection(rows: settingsRows)
        sections.append(objSettingsSection2)
        
        let objSettingsRows18: SettingsRow = SettingsRow(icon:  "bell.badge.fill", title: "Notifications", kind: .disclosure)
        let objSettingsRows19: SettingsRow = SettingsRow(icon:  "speaker.wave.3.fill", title: "Sounds & Haptics", kind: .disclosure)
        let objSettingsRows20: SettingsRow = SettingsRow(icon:  "moon.fill", title: "Focus", kind: .disclosure)
        let objSettingsRows21: SettingsRow = SettingsRow(icon:  "hourglass", title: "Screen Time", kind: .disclosure)
        settingsRows = []
        settingsRows.append(objSettingsRows18)
        settingsRows.append(objSettingsRows19)
        settingsRows.append(objSettingsRows20)
        settingsRows.append(objSettingsRows21)
        let objSettingsSection3: SettingsSection = SettingsSection(rows: settingsRows)
        sections.append(objSettingsSection3)
        
        let objSettingsRows22: SettingsRow = SettingsRow(icon:  "faceid", title: "Face ID & Passcode", kind: .disclosure)
        let objSettingsRows23: SettingsRow = SettingsRow(icon:  "sos", title: "Emergency SOS", kind: .disclosure)
        let objSettingsRows24: SettingsRow = SettingsRow(icon:  "lock.shield", title: "Privacy & Security", kind: .disclosure)
        settingsRows = []
        settingsRows.append(objSettingsRows22)
        settingsRows.append(objSettingsRows23)
        settingsRows.append(objSettingsRows24)
        let objSettingsSection4: SettingsSection = SettingsSection(rows: settingsRows)
        sections.append(objSettingsSection4)
        
        let objSettingsRows25: SettingsRow = SettingsRow(icon:  "gamecontroller.fill", title: "Game Center", kind: .disclosure)
        let objSettingsRows26: SettingsRow = SettingsRow(icon:  "icloud", title: "iCloud", kind: .disclosure)
        let objSettingsRows27: SettingsRow = SettingsRow(icon:  "creditcard", title: "Wallet & Apple Pay", kind: .disclosure)
        settingsRows = []
        settingsRows.append(objSettingsRows25)
        settingsRows.append(objSettingsRows26)
        settingsRows.append(objSettingsRows27)
        let objSettingsSection5: SettingsSection = SettingsSection(rows: settingsRows)
        sections.append(objSettingsSection5)
        
        let objSettingsRows28: SettingsRow = SettingsRow(icon:  "square.grid.3x2.fill", title: "Apps", kind: .disclosure)
        settingsRows = []
        settingsRows.append(objSettingsRows28)
        let objSettingsSection6: SettingsSection = SettingsSection(rows: settingsRows)
        sections.append(objSettingsSection6)
        
        visibleSections = sections
        settingsTableView.reloadData()
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
        let row = visibleSections[indexPath.section].rows[indexPath.row]
        cell.titleLabel.text = row.title
        cell.detailLabel.text = row.detail
        cell.iconImageView.image = UIImage(systemName: row.icon)
        switch row.kind {
        case .disclosure:
            cell.accessoryType = .disclosureIndicator
            cell.accessoryView = nil
        case .toggle(let isOn):
            cell.accessoryType = .none
            let sw = UISwitch()
            sw.isOn = isOn
            cell.accessoryView = sw
        }
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
    func setupUI() {
        view.backgroundColor = .systemBackground
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
