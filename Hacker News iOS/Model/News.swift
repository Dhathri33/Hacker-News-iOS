//
//  News.swift
//  Hacker News iOS
//
//  Created by Dhathri Bathini on 8/27/25.
//
struct News {
    let id: String?
    let title: String?
    let num_comments: Int?
    let points: Int?
    let url: String?
    let author: String?
    let created_at: String?
    
    static func sampleData() -> [News] {
        return [
            News(id: "1", title: "Show HN: Draw a fish and watch it swim with the others", num_comments: 211, points: 813, url: "https://www.google.com", author: "hallak", created_at: "4 days ago"),
            News(id: "2", title: "At 17, Hannah Cairo solved a major math mystery", num_comments: 125, points: 246, url: "https://www.google.com", author: "baruchel", created_at: "12 hours ago"),
            News(id: "3", title: "Replacing tmux in my dev workflow", num_comments: 275, points: 242, url: "https://www.google.com", author: "elashri", created_at: "20 hours ago"),
            News(id: "4", title: "Cerebras Code", num_comments: 99, points: 236, url: "https://www.google.com", author: "d3vr", created_at: "7 hours ago"),
            News(id: "5", title: "I couldn't submit a PR, so I got hired and fixed it myself", num_comments: 119, points: 206, url: "https://www.google.com", author: "skeptrune", created_at: "12 hours ago"),
            News(id: "6", title: "Google shifts goo.gl policy: Inactive links deactivated, active links preserved", num_comments: 151, points: 204, url: "https://www.google.com", author: "shuuji3", created_at: "11 hours ago")
        ]
    }
}
