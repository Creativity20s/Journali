//
//  AddJournalView.swift
//  Journali
//
//  Created by rima on 05/06/1448 AH.
//

import SwiftUI

struct AddJournalView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var viewModel: JournalViewModel
    @State private var title = ""
    @State private var content = ""

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 8) {
                TextField("Title", text: $title)
                    .font(.system(size: 34, weight: .bold))

                Text(Date().formatted(date: .numeric, time: .omitted))
                    .font(.system(size: 14))
                    .foregroundStyle(Color("TS"))

                ZStack(alignment: .topLeading) {
                    if content.isEmpty {
                        Text("Type your Journal...")
                            .foregroundStyle(.secondary)
                            .padding(.top, 8)
                            .padding(.leading, 5)
                    }

                    TextEditor(text: $content)
                        .scrollContentBackground(.hidden)
                }
                .font(.system(size: 20))
            }
            .padding()
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "xmark")
                        }
                    }

                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            viewModel.addJournal(title: title, content: content)
                            dismiss()
                        } label: {
                            Image(systemName: "checkmark")
                        }
                    }
                }
        }
    }
}

#Preview {
    AddJournalView(viewModel: JournalViewModel())
        .preferredColorScheme(.dark)
}
