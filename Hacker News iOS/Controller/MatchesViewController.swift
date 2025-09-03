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
    var matchesViewModel: MatchesViewModel = MatchesViewModel()
    
    //MARK: View Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegates()
        setupUI()
    }
}

//MARK: TableView DataSource Methods

extension MatchesViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return matchesViewModel.getNumberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matchesViewModel.getNumberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MatchesTableCell.reuseIdentifier, for: indexPath) as? MatchesTableCell else {
            return UITableViewCell()
        }
        cell.loadCellData(match: matchesViewModel.getMatch(section: indexPath.section, Row: indexPath.row))
        return cell
    }
}

//MARK: TableView Delegate Methods

extension MatchesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return matchesViewModel.getHeaderHeight()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(
            withIdentifier: TeamHeaderView.reuseID
        ) as? TeamHeaderView ?? TeamHeaderView(reuseIdentifier: TeamHeaderView.reuseID)
        header.configure(section: matchesViewModel.getSection(at: section))
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
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
        
        matchesTableView.translatesAutoresizingMaskIntoConstraints = false
        matchesTableView.backgroundColor = .systemGroupedBackground
        matchesTableView.separatorStyle = .none
        matchesTableView.rowHeight = UITableView.automaticDimension
        matchesTableView.estimatedRowHeight = 80
        
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
}
