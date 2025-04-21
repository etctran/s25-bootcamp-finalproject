//
//  ExerciseDetailView.swift
//  s25-bootcamp-finalproj
//
//  Created by Ethan Tran on 4/6/25.
//
import SwiftUI

struct ExerciseDetailView: View {
    let exercise: Exercise

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(exercise.name)
                    .font(.title)
                    .bold()

                Text(stripHTML(from: exercise.description))
                    .font(.body)
                    .foregroundColor(.secondary)

                Spacer()
            }
            .padding()
        }
        .navigationTitle(exercise.name)
        .navigationBarTitleDisplayMode(.inline)
    }

    func stripHTML(from string: String) -> String {
        let regex = try? NSRegularExpression(pattern: "<[^>]+>", options: .caseInsensitive)
        let range = NSRange(location: 0, length: string.utf16.count)
        let stripped = regex?.stringByReplacingMatches(in: string, options: [], range: range, withTemplate: "") ?? string
        return stripped
    }

    }

