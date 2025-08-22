//
//  ViewController.swift
//  Hacker News iOS
//
//  Created by Dhathri Bathini on 8/22/25.
//

import UIKit

struct News {
    let id: String?
    let title: String?
    let num_comments: Int?
    let points: Int?
    let url: String?
    let author: String?
    let created_at: String?
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableViewList: UITableView!
    
    var newsList: [News] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewList.dataSource = self
        tableViewList.delegate = self
        
        let objNewsList1: News = News(id: "1", title: "Show HN: Draw a fish and watch it swim with the others", num_comments: 211, points: 813, url: "https://www.google.com", author: "hallak", created_at: "4 days ago")
        let objNewsList2: News = News(id: "2", title: "At 17, Hannah Cairo solved a major math mystery", num_comments: 125, points: 246, url: "https://www.google.com", author: "baruchel", created_at: "12 hours ago")
        let objNewsList3: News = News(id: "3", title: "Replacing tmux in my dev workflow", num_comments: 275, points: 242, url: "https://www.google.com", author: "elashri", created_at: "20 hours ago")
        let objNewsList4: News = News(id: "4", title: "Cerebras Code", num_comments: 99, points: 236, url: "https://www.google.com", author: "d3vr", created_at: "7 hours ago")
        let objNewsList5: News = News(id: "5", title: "I couldn't submit a PR, so I got hired and fixed it myself", num_comments: 119, points: 206, url: "https://www.google.com", author: "skeptrune", created_at: "12 hours ago")
        let objNewsList6: News = News(id: "6", title: "Google shifts goo.gl policy: Inactive links deactivated, active links preserved", num_comments: 151, points: 204, url: "https://www.google.com", author: "shuuji3", created_at: "11 hours ago")
        newsList.append(objNewsList1)
        newsList.append(objNewsList2)
        newsList.append(objNewsList3)
        newsList.append(objNewsList4)
        newsList.append(objNewsList5)
        newsList.append(objNewsList6)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        190
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        newsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell") as? TableCell else {
            return UITableViewCell()
        }
       let newsItem: News = newsList[indexPath.row]
        cell.titleOfThePost.text = newsItem.title
        cell.postDetails.text = "\(newsItem.author ?? " ") . \(newsItem.created_at ?? " ") . by \(newsItem.author ?? " ")"
        cell.points.text = "\(newsItem.points ?? 0)"
        cell.numberOfComments.text = "\(newsItem.num_comments ?? 0)"
        return cell
    }
}

