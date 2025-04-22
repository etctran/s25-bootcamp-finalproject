//
//  SessionListView.swift
//  s25-bootcamp-finalproj
//
//  Created by Ethan Tran on 4/22/25.
//

import SwiftUI

struct SessionListView: View {
    @Binding var sessions: [WorkoutSession]
    @Binding var editingSession: WorkoutSession?

    var body: some View {
        List {
            ForEach(sessions.indices, id: \..self) { index in
                if !sessions[index].exercises.isEmpty {
                    Section(header: Text("Session on \(formattedDate(sessions[index].date))")) {
                        ForEach(sessions[index].exercises) { workout in
                            WorkoutRowView(workout: workout)
                        }
                        .onDelete { workoutIndices in
                            sessions[index].exercises.remove(atOffsets: workoutIndices)
                            if sessions[index].exercises.isEmpty {
                                sessions.remove(at: index)
                            }
                        }
                    }
                    .onTapGesture {
                        editingSession = sessions[index]
                    }
                }
            }
        }
        .listStyle(.plain)
    }

    func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}
