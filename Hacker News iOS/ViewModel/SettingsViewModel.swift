//
//  SettingsViewModel.swift
//  Hacker News iOS
//
//  Created by Dhathri Bathini on 9/4/25.
//

import UIKit

class SettingsViewModel {

    var settingsRows: [SettingsRow] = []
    var sections: [SettingsSection] = []
    var visibleSections: [SettingsSection] = []
    
    init() {
        sections = SettingsSection.sampleData()
        visibleSections = sections
    }
    
    func getNumberOfSections() -> Int {
        return visibleSections.count
    }
    
    func getNumberOfRows(in section: Int) -> Int {
        return visibleSections[section].rows.count
    }
    
    func getSection(at index: Int) -> SettingsSection {
        return visibleSections[index]
    }
    
    func getRow(at indexPath: IndexPath) -> SettingsRow {
        return visibleSections[indexPath.section].rows[indexPath.row]
    }
    
    func applyFilter(_ text: String) {
        let query = text.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !query.isEmpty else {
            visibleSections = sections
            return
        }
        let lower = query.lowercased()
        visibleSections = sections.compactMap { section in
            let filteredRows = section.rows.filter { row in
                let inTitle = row.title.lowercased().contains(lower)
                return inTitle
            }
            return filteredRows.isEmpty ? nil : SettingsSection(rows: filteredRows)
        }
    }
}
