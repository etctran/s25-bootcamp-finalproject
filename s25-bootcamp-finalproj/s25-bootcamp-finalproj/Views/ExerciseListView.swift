//
//  ExerciseListView.swift
//  s25-bootcamp-finalproj
//
//  Created by Ethan Tran on 4/6/25.
//

import SwiftUI

struct ExerciseListView: View {
    @Binding var selectedExercise: String
    @State private var exercises: [Exercise] = []
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView {
            List(exercises) { exercise in
                Button(action: {
                    selectedExercise = exercise.name
                    dismiss()
                }) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(exercise.name)
                            .font(.headline)
                        Text(stripHTML(from: exercise.description))
                            .font(.caption)
                            .lineLimit(2)
                            .foregroundColor(.gray)
                    }
                    .padding(.vertical, 4)
                }
            }
            .navigationTitle("Browse Exercises")
            .task {
                do {
                    exercises = try await ExerciseManager.fetchExercises()
                } catch {
                    print("Error loading exercises: \(error)")
                }
            }
        }
        .preferredColorScheme(.dark)
    }

    func stripHTML(from string: String) -> String {
        guard let data = string.data(using: .utf16) else { return string }
        let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
            .documentType: NSAttributedString.DocumentType.html
        ]
        let attributedString = try? NSAttributedString(data: data, options: options, documentAttributes: nil)
        return attributedString?.string ?? string
    }
}
