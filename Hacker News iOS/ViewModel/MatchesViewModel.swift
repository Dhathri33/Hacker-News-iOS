//
//  MatchesViewModel.swift
//  Hacker News iOS
//
//  Created by Dhathri Bathini on 9/3/25.
//
import CoreGraphics

class MatchesViewModel {
    
    var sections: [TeamsSection] = []
    
    init() {
        sections = TeamsSection.sampleData()
    }
    
    func getNumberOfSections() -> Int {
        return sections.count
    }
    
    func getNumberOfRows(in section: Int) -> Int {
        return sections[section].matches.count
    }
    
    func getSection(at index: Int) -> TeamsSection {
        return sections[index]
    }
    
    func getMatch(section: Int, Row: Int) -> MatchRow {
        return sections[section].matches[Row]
    }
    
    func getHeaderHeight() -> CGFloat {
        return 64
    }
}
