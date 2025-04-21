//
//  AddSessionView.swift
//  s25-bootcamp-finalproj
//
//  Created by Ethan Tran on 4/6/25.
//

import SwiftUI

struct AddSessionView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var sessions: [WorkoutSession]
    @State private var workouts: [Workout] = []

    var body: some View {
        NavigationView {
            VStack {
                List(workouts) { workout in
                    Text("\(workout.name) - \(workout.sets.count) sets")
                }

                Button("Add Exercise") {
                    showingAddWorkout = true
                }
                .sheet(isPresented: $showingAddWorkout) {
                    AddWorkoutView(workouts: $workouts)
                }

                Button("Save Session") {
                    let newSession = WorkoutSession(date: Date(), exercises: workouts)
                    sessions.append(newSession)
                    dismiss()
                }
            }
            .navigationTitle("New Session")
        }
    }

    @State private var showingAddWorkout = false
}

