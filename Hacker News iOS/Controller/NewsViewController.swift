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
    var newsList: [News] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegates()
        buildData()
    }
}

//MARK: TableView DataSource Methods

extension NewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        newsList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableCell") as? NewsTableCell else {
            return UITableViewCell()
        }
       cell.loadCellData(news: newsList[indexPath.row])
       return cell
    }
}

//MARK: TableView Delegate Methods

extension NewsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        190
    }
}

//MARK: Helper functions

extension NewsViewController {
    fileprivate func buildData() {
        newsList = News.sampleData()
    }
    
    fileprivate func setupDelegates() {
        tableViewList.dataSource = self
        tableViewList.delegate = self
    }
}
