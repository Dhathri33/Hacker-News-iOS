//
//  MatchesViewController.swift
//  Hacker News iOS
//
//  Created by Dhathri Bathini on 9/3/25.
//

import UIKit

class MatchesViewController: UIViewController {
    
    //MARK: Properties
    let matchesTableView = UITableView(frame: .zero, style: .insetGrouped)
    var sections: [TeamsSection] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegates()
        setupUI()
        buildData()
    
    }
}

//MARK: TableView DataSource Methods
extension MatchesViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let rowCount = sections[section].matches.count
        return rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MatchesTableCell.reuseIdentifier, for: indexPath) as? MatchesTableCell else {
            return UITableViewCell()
        }
        
        let match = sections[indexPath.section].matches[indexPath.row]
        cell.loadCellData(match: match)
        return cell
    }
}

//MARK: TableView Delegate Methods
extension MatchesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 64
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(
            withIdentifier: TeamHeaderView.reuseID
        ) as? TeamHeaderView ?? TeamHeaderView(reuseIdentifier: TeamHeaderView.reuseID)
        let model = sections[section]
        header.configure(crestName: model.cityImage, teamName: model.cityName, relativeText: model.relativeTime)
        return header
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = .clear
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

//MARK: Helper functions
extension MatchesViewController {
    func setupDelegates() {
        matchesTableView.dataSource = self
        matchesTableView.delegate = self
    }
    
    func setupUI() {
        view.backgroundColor = .systemGroupedBackground
        title = "Matches"
        
        // Configure table view
        matchesTableView.translatesAutoresizingMaskIntoConstraints = false
        matchesTableView.backgroundColor = .systemGroupedBackground
        matchesTableView.separatorStyle = .none
        matchesTableView.rowHeight = UITableView.automaticDimension
        matchesTableView.estimatedRowHeight = 80
        
        // Register cells and headers
        matchesTableView.register(MatchesTableCell.self, forCellReuseIdentifier: MatchesTableCell.reuseIdentifier)
        matchesTableView.register(TeamHeaderView.self, forHeaderFooterViewReuseIdentifier: TeamHeaderView.reuseID)
        
        view.addSubview(matchesTableView)
        
        NSLayoutConstraint.activate([
            matchesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 4),
            matchesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -4),
            matchesTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 4),
            matchesTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -4)
        ])
    }
    
    func buildData() {
        sections = TeamsSection.sampleData()
        matchesTableView.reloadData()
    }
}
