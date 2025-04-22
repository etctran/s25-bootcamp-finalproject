//
//  EditWorkoutView.swift
//  s25-bootcamp-finalproj
//
//  Created by Ethan Tran on 4/14/25.
//


import SwiftUI

struct EditWorkoutView: View {
    @Environment(\.dismiss) var dismiss
    var workout: Workout
    @Binding var workouts: [Workout]

    @State private var name: String = ""
    @State private var muscleGroup: String = ""
    @State private var setEntries: [SetEntry] = []
    @State private var categories: [ExerciseCategory] = []

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Exercise Info")) {
                    TextField("Exercise Name", text: $name)
                    Picker("", selection: $muscleGroup) {
                        ForEach(categories) { category in
                            Text(category.name).tag(category.name)
                        }
                    }
                }

                Section(header: Text("Sets")) {
                    ForEach(setEntries.indices, id: \.self) { i in
                        HStack {
                            Text("Set \(i + 1)")
                            Spacer()
                            TextField("Reps", value: $setEntries[i].reps, format: .number)
                                .keyboardType(.numberPad)
                                .frame(width: 50)
                            Text("reps")
                            TextField("Weight", value: $setEntries[i].weight, format: .number)
                                .keyboardType(.numberPad)
                                .frame(width: 60)
                            Text("lbs")
                        }
                    }
                    Button("Add Set") {
                        setEntries.append(SetEntry(reps: 0, weight: 0))
                    }
                }
            }
            .navigationTitle("Edit Workout")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        if let index = workouts.firstIndex(where: { $0.id == workout.id }) {
                            workouts[index].name = name
                            workouts[index].muscleGroup = muscleGroup
                            workouts[index].sets = setEntries
                        }
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
            .onAppear {
                self.name = workout.name
                self.muscleGroup = workout.muscleGroup
                self.setEntries = workout.sets
            }
        }
    }
}
