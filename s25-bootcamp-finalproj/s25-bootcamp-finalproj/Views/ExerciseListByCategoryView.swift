//
//  ExerciseListByCategoryView.swift
//  s25-bootcamp-finalproj
//
//  Created by Ethan Tran on 4/6/25.
//
import SwiftUI

struct ExerciseListByCategoryView: View {
    let category: String
    @State private var exercises: [Exercise] = []

    var body: some View {
        NavigationView {
            List(exercises) { exercise in
                NavigationLink(destination: ExerciseDetailView(exercise: exercise)) {
                    Text(exercise.name)
                        .foregroundColor(.white)
                }
            }
            .navigationTitle(category)
            .task {
                do {
                    let all = try await ExerciseManager.fetchExercises()
                    self.exercises = all.filter {
                        $0.name.localizedCaseInsensitiveContains(category)
                    }
                } catch {
                    print("Failed to fetch exercises")
                }
            }
        }
        .background(Color.black)
        .preferredColorScheme(.dark)
    }
}
