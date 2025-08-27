//
//  Untitled.swift
//  Hacker News iOS
//
//  Created by Dhathri Bathini on 8/27/25.
//

struct ContactsRow {
    let profileImage: String
    let contactName: String
    let contactTitle: String
    let flagImage: String
    
    static func sampleData() -> [ContactsRow] {
        return [ContactsRow(profileImage: "profilem1", contactName: "Mohammad Hussain", contactTitle: "SEO Specialist", flagImage: "flag1"),
                ContactsRow(profileImage: "profilem2", contactName: "John Young", contactTitle: "Interactive Designer", flagImage: "flag2"),
                ContactsRow(profileImage: "profilew1", contactName: "Tamilarasi Mohan", contactTitle: "Architect", flagImage: "flag3"),
                ContactsRow(profileImage: "profilew2", contactName: "Kim Yu", contactTitle: "Economist", flagImage: "flag4"),
                ContactsRow(profileImage: "profilem3", contactName: "Derek Fowler", contactTitle: "Web Strategist", flagImage: "flag5"),
                ContactsRow(profileImage: "profilew3", contactName: "Shreya Nithin", contactTitle: "Product Designer", flagImage: "flag6"),
                ContactsRow(profileImage: "profilew4", contactName: "Emily Adams", contactTitle: "Editor", flagImage: "flag7")
                ]
    }
}

