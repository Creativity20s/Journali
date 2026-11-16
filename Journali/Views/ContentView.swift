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
    @State private var showAddSheet = false
    @State private var showDeleteAlert = false
    @State private var journalToDelete: Journal?
    @State private var journalToEdit: Journal?
    
    var body: some View {
        NavigationStack {
            Group {
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
                            .multilineTextAlignment(.center)
                    }
                    .padding(.horizontal, 40)
                } else {
                    List {
                        ForEach(viewModel.journals) { journal in JournalCardView(journal: journal) {
                            viewModel.toggleBookmark(for: journal)
                        }
                        .onTapGesture {
                            journalToEdit = journal
                        }
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                        .swipeActions(edge: .trailing) {
                            Button {
                                journalToDelete = journal
                                showDeleteAlert = true
                            } label: {
                                Image(systemName: "trash.fill")
                            }
                            .tint(Color("SD"))
                        }
                        }
                    }
                    .listStyle(.plain)
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
                                    showAddSheet = true
                                } label: {
                                    Image(systemName: "plus")
                                }
                            }
                        }
                        .sheet(isPresented: $showAddSheet) {
                            JournalEditorView(viewModel: viewModel)
                        }
                        .sheet(item: $journalToEdit) { journal in
                            JournalEditorView(viewModel: viewModel, journal: journal)
                        }
                        .alert("Delete Journal?", isPresented: $showDeleteAlert) {
                            Button("Cancel", role: .cancel) { }
                            Button("Delete", role: .destructive) {
                                if let journal = journalToDelete {
                                    viewModel.deleteJournal(journal)
                                }
                            }
                        } message: {
                            Text("Are you sure you want to delete this journal?")
                        }
                    }
                    .tint(.primary)
                }
            }

            #Preview {
                ContentView()
                    .preferredColorScheme(.dark)
            }
