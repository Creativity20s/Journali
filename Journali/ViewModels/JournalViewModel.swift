//
//  JournalViewModel.swift
//  Journali
//
//  Created by rima on 30/05/1448 AH.
//

import Foundation
import Combine

class JournalViewModel: ObservableObject {
    @Published var journals: [Journal] = [
        Journal(title: "My Birthday", content: "Best day ever with my family and friends!", isBookmarked: true),
            Journal(title: "Today's Journal", content: "Started learning SwiftUI today."),
            Journal(title: "Great Day", content: "Finished the splash screen and main page!")
        ]
}

