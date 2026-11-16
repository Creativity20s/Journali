//
//  AddJournalView.swift
//  Journali
//
//  Created by rima on 05/06/1448 AH.
//

import SwiftUI

struct JournalEditorView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var viewModel: JournalViewModel
    var journal: Journal? = nil

    @State private var title = ""
    @State private var content = ""
    @State private var showDiscardAlert = false

    private var hasChanges: Bool {
        title != (journal?.title ?? "") || content != (journal?.content ?? "")
    }

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 8) {
                TextField("Title", text: $title)
                    .font(.system(size: 34, weight: .bold))

                Text((journal?.date ?? Date()).formatted(date: .numeric, time: .omitted))
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
                        .scrollDismissesKeyboard(.interactively)
                }
                .font(.system(size: 20))
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        if hasChanges {
                            showDiscardAlert = true
                        } else {
                            dismiss()
                        }
                    } label: {
                        Image(systemName: "xmark")
                    }
                    .confirmationDialog(
                        "Are you sure you want to discard changes on this journal?",
                        isPresented: $showDiscardAlert,
                        titleVisibility: .visible
                    ) {
                        Button("Discard Changes", role: .destructive) {
                            dismiss()
                        }
                        Button("Keep Editing") { }
                    }
                }

                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        save()
                    } label: {
                        Image(systemName: "checkmark")
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(Color("AP"))
                }
            }
            .onAppear {
                if let journal {
                    title = journal.title
                    content = journal.content
                }
            }
        }
        .interactiveDismissDisabled(hasChanges)
    }

    private func save() {
        if let journal {
            viewModel.updateJournal(journal, title: title, content: content)
        } else {
            viewModel.addJournal(title: title, content: content)
        }
        dismiss()
    }
}

#Preview {
    JournalEditorView(viewModel: JournalViewModel())
        .preferredColorScheme(.dark)
}
