//
//  ContentView.swift
//  s25-bootcamp-finalproj
//
//  Created by Ethan Tran on 4/6/25.
//

import SwiftUI

struct ContentView: View {
    @State private var sessions: [WorkoutSession] = []
    @State private var showingAddSession = false
    @State private var editingSession: WorkoutSession?

    var body: some View {
        NavigationView {
            VStack {
                if sessions.isEmpty {
                    Spacer()
                    VStack(spacing: 12) {
                        Image(systemName: "dumbbell.fill")
                            .font(.system(size: 50))
                            .foregroundColor(.gray)

                        Text("Tap + to track your first workout")
                            .foregroundColor(.gray)
                            .font(.subheadline)
                    }
                    Spacer()
                } else {
                    List {
                        ForEach(sessions.indices, id: \.self) { index in
                            Section(header: Text("Session on \(formattedDate(sessions[index].date))")) {
                                ForEach(sessions[index].exercises) { workout in
                                    WorkoutRowView(workout: workout)
                                }
                            }
                            .onTapGesture {
                                editingSession = sessions[index]
                            }
                        }
                        .onDelete { indexSet in
                            sessions.remove(atOffsets: indexSet)
                        }
                    }
                    .listStyle(.plain)
                }

                Button(action: {
                    showingAddSession = true
                }) {
                    Label("Add Workout", systemImage: "plus.circle.fill")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.cyan)
                        .foregroundColor(.black)
                        .cornerRadius(12)
                        .padding(.horizontal)
                }
                .padding(.bottom)
            }
            .navigationTitle("Repit")
            .sheet(isPresented: $showingAddSession) {
                AddSessionView(sessions: $sessions)
            }
            .sheet(item: $editingSession) { session in
                EditSessionView(session: session, sessions: $sessions)
            }
        }
        .preferredColorScheme(.dark)
    }

    func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}

#Preview {
    ContentView()
}
