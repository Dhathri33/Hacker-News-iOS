//
//  ContactsViewModel.swift
//  Hacker News iOS
//
//  Created by Dhathri Bathini on 9/4/25.
//

import UIKit

class ContactsViewModel {

    var contactsRow: [ContactsRow] = []
    var visibleContacts: [ContactsRow] = []
    
    init() {
        contactsRow = ContactsRow.sampleData()
        visibleContacts = contactsRow
    }
    
    func getNumberOfRows() -> Int {
        return visibleContacts.count
    }
    
    func getContact(Row: Int) -> ContactsRow {
        return visibleContacts[Row]
    }
    
    func getRowHeight() -> CGFloat {
        105
    }
    
    func applyFilter(_ text: String) {
        let query = text.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !query.isEmpty else {
            visibleContacts = contactsRow
            return
        }
        visibleContacts = contactsRow.filter {
            $0.contactName.range(of: query, options: [.caseInsensitive, .diacriticInsensitive]) != nil
        }
    }
    
}
