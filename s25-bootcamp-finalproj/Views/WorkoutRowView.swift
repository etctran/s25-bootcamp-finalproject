//
//  WorkoutRowView.swift
//  s25-bootcamp-finalproj
//
//  Created by Ethan Tran on 4/6/25.
//

import SwiftUI

struct WorkoutRowView: View {
    let workout: Workout

    var body: some View {
        VStack(alignment: .leading) {
            Text(workout.name)
                .font(.headline)

            ForEach(workout.sets) { set in
                Text("\(set.reps) reps @ \(set.weight) lbs")
                    .font(.caption)
            }

            Text("Muscle: \(workout.muscleGroup)")
                .font(.caption)
            Text("Date: \(formattedDate(workout.date))")
                .font(.caption2)
                .foregroundColor(.gray)
        }
    }

    func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}
