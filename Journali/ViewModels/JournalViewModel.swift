//
//  JournalViewModel.swift
//  Journali
//
//  Created by rima on 30/05/1448 AH.
//

import Foundation
import Combine

enum SortOption {
    case date
    case bookmark
}

class JournalViewModel: ObservableObject {
    @Published var journals: [Journal] = [
        Journal(title: "My Birthday", content: "Best day ever with my family and friends!", isBookmarked: true),
            Journal(title: "Today's Journal", content: "Started learning SwiftUI today."),
            Journal(title: "Great Day", content: "Finished the splash screen and main page!")
        ]
    @Published var sortOption: SortOption = .date

    var displayedJournals: [Journal] {
        switch sortOption {
        case .date:
            return journals.sorted { $0.date > $1.date }
        case .bookmark:
            return journals.filter { $0.isBookmarked }
        }
    }
    
    func addJournal(title: String, content: String) {
        let newJournal = Journal(title: title, content: content)
        journals.insert(newJournal, at: 0)
    }
    func toggleBookmark(for journal: Journal) {
        if let index = journals.firstIndex(where: { $0.id == journal.id }) {
            journals[index].isBookmarked.toggle()
        }
    }
    func updateJournal(_ journal: Journal, title: String, content: String) {
        if let index = journals.firstIndex(where: { $0.id == journal.id }) {
            journals[index].title = title
            journals[index].content = content
        }
    }

    func deleteJournal(_ journal: Journal) {
        journals.removeAll { $0.id == journal.id }
    }
}

