//
//  AddWorkoutView.swift
//  s25-bootcamp-finalproj
//
//  Created by Ethan Tran on 4/6/25.
//

import SwiftUI

struct AddWorkoutView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var workouts: [Workout]

    @State private var exerciseName: String = ""
    @State private var muscleGroup = "Chest"
    @State private var date = Date()
    @State private var setEntries: [SetEntry] = []

    let muscleGroups = ["Chest", "Back", "Legs", "Arms", "Shoulders", "Core"]

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Exercise")) {
                    TextField("Exercise name", text: $exerciseName)
                        .textInputAutocapitalization(.words)
                }

                Section(header: Text("Muscle Group")) {
                    Picker("Muscle Group", selection: $muscleGroup) {
                        ForEach(muscleGroups, id: \.self) {
                            Text($0)
                        }
                    }
                }

                Section(header: Text("Date")) {
                    DatePicker("Date", selection: $date, displayedComponents: .date)
                }

                Section(header: Text("Sets")) {
                    ForEach(setEntries.indices, id: \.self) { index in
                        HStack {
                            Text("Set \(index + 1)")
                            Spacer()
                            TextField("Reps", value: $setEntries[index].reps, format: .number)
                                .keyboardType(.numberPad)
                                .frame(width: 50)
                            Text("reps")
                            TextField("Weight", value: $setEntries[index].weight, format: .number)
                                .keyboardType(.numberPad)
                                .frame(width: 60)
                            Text("lbs")
                        }
                    }

                    Button("Add Set") {
                        setEntries.append(SetEntry(reps: 0, weight: 0))
                    }
                    .foregroundColor(.blue)
                }
            }
            .navigationTitle("Add Workout")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        let workoutName = exerciseName.isEmpty ? "Unnamed" : exerciseName
                        let newWorkout = Workout(
                            name: workoutName,
                            muscleGroup: muscleGroup,
                            sets: setEntries,
                            date: date
                        )
                        workouts.append(newWorkout)
                        dismiss()
                    }
                }

                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}
