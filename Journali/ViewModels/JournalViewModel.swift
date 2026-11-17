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
    @Published var journals: [Journal] = []
    @Published var sortOption: SortOption = .date
    @Published var searchText = ""
    
    var displayedJournals: [Journal] {
        var result: [Journal]
        
        switch sortOption {
        case .date:
            result = journals.sorted { $0.date > $1.date }
        case .bookmark:
            result = journals.filter { $0.isBookmarked }
        }
        
        if !searchText.isEmpty {
            result = result.filter {
                $0.title.localizedCaseInsensitiveContains(searchText) ||
                $0.content.localizedCaseInsensitiveContains(searchText)
            }
        }
        
        return result
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

