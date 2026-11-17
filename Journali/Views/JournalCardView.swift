//
//  JournalCardView.swift
//  Journali
//
//  Created by rima on 05/06/1448 AH.
//

import SwiftUI

struct JournalCardView: View {
    let journal: Journal
    let onBookmark: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(journal.title)
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundStyle(Color("TA"))
                
                Spacer()
                
                Button {
                    onBookmark()
                } label: {
                    Image(systemName: journal.isBookmarked ? "bookmark.fill" : "bookmark")
                        .foregroundStyle(Color("AP"))
                }
                .buttonStyle(.borderless)
            }
            
            Text(journal.date.formatted(date: .numeric, time: .omitted))
                .font(.system(size: 14))
                .foregroundStyle(Color("TS"))
            
            Text(journal.content)
                .font(.system(size: 16))
        }
        .padding(20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color("SC"))
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    JournalCardView(journal: Journal(title: "Great Day", content: "Today was amazing, I learned SwiftUI!"), onBookmark: {})
        .padding()
        .preferredColorScheme(.dark)
}
