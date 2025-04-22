//
//  EditSessionView.swift
//  s25-bootcamp-finalproj
//
//  Created by Ethan Tran on 4/20/25.
//

import SwiftUI

struct EditSessionView: View {
    var session: WorkoutSession
    @Binding var sessions: [WorkoutSession]
    @Environment(\.dismiss) var dismiss
    
    @State private var workouts: [Workout] = []
    @State private var showingAddWorkout = false
    @State private var editingWorkout: Workout?
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(workouts) { workout in
                        Button {
                            editingWorkout = workout
                        } label: {
                            HStack {
                                Text(workout.name)
                                Spacer()
                                Text("\(workout.sets.count) sets")
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    .onDelete { indexSet in
                        workouts.remove(atOffsets: indexSet)
                    }
                }
                
                Button("Add Exercise") {
                    showingAddWorkout = true
                }
                .padding()
                
                Button("Save Session") {
                    if let index = sessions.firstIndex(where: { $0.id == session.id }) {
                        sessions[index].exercises = workouts
                        dismiss()
                    }
                }
                .padding()
            }
            .navigationTitle("New Session")
            .onAppear {
                self.workouts = session.exercises
            }
            .sheet(isPresented: $showingAddWorkout) {
                AddWorkoutView(workouts: $workouts)
            }
            .sheet(item: $editingWorkout) { workout in
                EditWorkoutView(workout: workout, workouts: $workouts)
            }
        }
    }

}
