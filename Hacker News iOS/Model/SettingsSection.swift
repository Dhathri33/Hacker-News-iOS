//
//  SettingsRow.swift
//  Hacker News iOS
//
//  Created by Dhathri Bathini on 8/27/25.
//
struct SettingsRow {
    let icon: String
    let title: String
    var detail: String? = nil
    let kind: RowKind
    
    enum RowKind {
        case disclosure
        case toggle(isOn: Bool)
    }
}

struct SettingsSection {
    var rows: [SettingsRow]
}
