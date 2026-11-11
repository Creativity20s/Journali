//
//  ContentView.swift
//  Journali
//
//  Created by rima on 30/05/1448 AH.
// MARK: - Colors
// AP  = Primary Accent
// TA  = Text Accent
// TPW = Text Primary White
// TS  = Text Secondary
// SC  = Surface Card
// BPB = Background Primary Black
// SD  = Semantic Destructive


import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = JournalViewModel()
    
    var body: some View {
        NavigationStack {
                   ZStack {
                       Color("BPB")
                           .ignoresSafeArea()

                       Text("عدد اليوميات: \(viewModel.journals.count)")
                           .foregroundStyle(Color("TPW"))
                   }
                   .navigationTitle("Journal")
               }
               .preferredColorScheme(.dark)
           }
       }
#Preview {
    ContentView()
}
