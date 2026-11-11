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
        Journal(title: "Great Day", content: "My first journal")
    ]
}

