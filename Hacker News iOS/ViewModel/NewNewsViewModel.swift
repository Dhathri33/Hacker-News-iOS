//
//  NewNewsViewModel.swift
//  Hacker News iOS
//
//  Created by Dhathri Bathini on 9/4/25.
//

import UIKit

class NewNewsViewModel {
    
    var newsList: [NewsDetails] = []
    
    init() {
        newsList = NewsDetails.sampleData()
    }

    func getNumberOfRows() -> Int {
        return newsList.count
    }
    
    func getNews(Row: Int) -> NewsDetails {
        return newsList[Row]
    }
    
    func getRowHeight() -> CGFloat {
        return 130
    }
}
