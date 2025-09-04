//
//  NewsViewModel.swift
//  Hacker News iOS
//
//  Created by Dhathri Bathini on 9/4/25.
//

import UIKit

class NewsViewModel {

    var newsList: [News] = []
        
    init() {
        newsList = News.sampleData()
    }

    func getNumberOfRows() -> Int {
        return newsList.count
    }
    
    func getNews(Row: Int) -> News {
        return newsList[Row]
    }
    
    func getRowHeight() -> CGFloat {
        return 190
    }
}
