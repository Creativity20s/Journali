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
                
                if viewModel.journals.isEmpty {
                    VStack(spacing: 12) {
                        Image("emptyBook")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120, height: 120)
                        
                        Text("Begin Your Journal")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundStyle(Color("TA"))
                        
                        Text("Craft your personal diary, tap the plus icon to begin")
                            .font(.system(size: 18, weight: .light))
                            .foregroundStyle(Color("TPW"))
                            .multilineTextAlignment(.center)
                    }
                    .padding(.horizontal, 40)
                } else {
                    Text("هنا بتطلع اليوميات")
                        .foregroundStyle(Color("TPW"))
                }
            }
            .navigationTitle("Journal")
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button {
                        print("فلتر")
                    } label: {
                        Image(systemName: "line.3.horizontal.decrease")
                    }

                    Button {
                        print("إضافة")
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        .preferredColorScheme(.dark)
        .tint(Color("TPW"))
    }
}
#Preview {
    ContentView()
}
