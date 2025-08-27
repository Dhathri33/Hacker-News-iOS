//
//  NewViewController.swift
//  Hacker News iOS
//
//  Created by Dhathri Bathini on 8/22/25.
//

import UIKit

struct NewsDetails {
    let id: String?
    let title: String?
    let num_comments: Int?
    let points: Int?
    let url: String?
    let author: String?
    let created_at: String?
}

class NewViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
    let tableView = UITableView()
    let titleLabel = UILabel()
    var newsList: [NewsDetails] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        setupUI()
        
        let objNewsList1: NewsDetails = NewsDetails(id: "1", title: "Show HN: Draw a fish and watch it swim with the others", num_comments: 211, points: 813, url: "https://www.google.com", author: "hallak", created_at: "4 days ago")
        let objNewsList2: NewsDetails = NewsDetails(id: "2", title: "At 17, Hannah Cairo solved a major math mystery", num_comments: 125, points: 246, url: "https://www.google.com", author: "baruchel", created_at: "12 hours ago")
        let objNewsList3: NewsDetails = NewsDetails(id: "3", title: "Replacing tmux in my dev workflow", num_comments: 275, points: 242, url: "https://www.google.com", author: "elashri", created_at: "20 hours ago")
        let objNewsList4: NewsDetails = NewsDetails(id: "4", title: "Cerebras Code", num_comments: 99, points: 236, url: "https://www.google.com", author: "d3vr", created_at: "7 hours ago")
        let objNewsList5: NewsDetails = NewsDetails(id: "5", title: "I couldn't submit a PR, so I got hired and fixed it myself", num_comments: 119, points: 206, url: "https://www.google.com", author: "skeptrune", created_at: "12 hours ago")
        let objNewsList6: NewsDetails = NewsDetails(id: "6", title: "Google shifts goo.gl policy: Inactive links deactivated, active links preserved", num_comments: 151, points: 204, url: "https://www.google.com", author: "shuuji3", created_at: "11 hours ago")
        newsList.append(objNewsList1)
        newsList.append(objNewsList2)
        newsList.append(objNewsList3)
        newsList.append(objNewsList4)
        newsList.append(objNewsList5)
        newsList.append(objNewsList6)
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
        tableView.register(NewTableCell.self, forCellReuseIdentifier: NewTableCell.reuseIdentifier)
        
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        130
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        newsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewTableCell.reuseIdentifier, for: indexPath) as? NewTableCell else {
            return UITableViewCell()
        }
        
        let newsItem: NewsDetails = newsList[indexPath.row]
         cell.titleLabel.text = newsItem.title
         cell.postDetailsLabel.text = "\(newsItem.author ?? " ") . \(newsItem.created_at ?? " ") . by \(newsItem.author ?? " ")"
         cell.pointsLabel.text = "\(newsItem.points ?? 0)"
         cell.commentsLabel.text = "\(newsItem.num_comments ?? 0)"
        return cell
    }
}
