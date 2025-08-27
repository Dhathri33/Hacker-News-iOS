//
//  NewViewController.swift
//  Hacker News iOS
//
//  Created by Dhathri Bathini on 8/22/25.
//

import UIKit

class NewNewsViewController: UIViewController {
    
    //MARK: Properties
    
    let tableView = UITableView()
    let titleLabel = UILabel()
    var newsList: [NewsDetails] = []
    
    //MARK: View Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegates()
        setupUI()
        buildData()
    }
}

//MARK: TableView DataSource Methods

extension NewNewsViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        newsList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewNewsTableCell.reuseIdentifier, for: indexPath) as? NewNewsTableCell else {
            return UITableViewCell()
        }
        cell.loadCellData(news: newsList[indexPath.row])
        return cell
    }
}

//MARK: TableView Delegate Methods

extension NewNewsViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        130
    }
}

//MARK: Helper functions

extension NewNewsViewController {
    fileprivate func buildData() {
        newsList = NewsDetails.sampleData()
    }
    
    func setupUI() {
        view.backgroundColor = .black
        titleLabel.text = "News"
        titleLabel.textColor = .white
        titleLabel.font = UIFont(name: "TimesNewRomanPS-BoldMT", size: 35)
        titleLabel.textAlignment = .left
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .black
        tableView.register(NewNewsTableCell.self, forCellReuseIdentifier: NewNewsTableCell.reuseIdentifier)
        // Vertical layout
        let vStack = UIStackView(arrangedSubviews: [titleLabel, tableView])
        vStack.axis = .vertical
        vStack.spacing = 20
        vStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(vStack)
        NSLayoutConstraint.activate([
            vStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            vStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            vStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            tableView.heightAnchor.constraint(equalToConstant: 680),
            tableView.widthAnchor.constraint(equalToConstant: 393)
        ])
    }
    
    fileprivate func setupDelegates() {
        tableView.dataSource = self
        tableView.delegate = self
    }
}
