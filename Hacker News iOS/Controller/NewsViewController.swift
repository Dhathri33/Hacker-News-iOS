//
//  ViewController.swift
//  Hacker News iOS
//
//  Created by Dhathri Bathini on 8/22/25.
//

import UIKit

class NewsViewController: UIViewController {
    
    //MARK: Properties
    
    @IBOutlet weak var tableViewList: UITableView!
    var newsViewModel: NewsViewModel = NewsViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegates()
    }
}

//MARK: TableView DataSource Methods

extension NewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        newsViewModel.getNumberOfRows()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableCell") as? NewsTableCell else {
            return UITableViewCell()
        }
        cell.loadCellData(news: newsViewModel.getNews(Row: indexPath.row))
        return cell
    }
}

//MARK: TableView Delegate Methods

extension NewsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        newsViewModel.getRowHeight()
    }
}

//MARK: Helper functions

extension NewsViewController {
    fileprivate func setupDelegates() {
        tableViewList.dataSource = self
        tableViewList.delegate = self
    }
}
