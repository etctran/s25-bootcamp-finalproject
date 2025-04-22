//
//  ExerciseCategoryListView.swift
//  s25-bootcamp-finalproj
//
//  Created by Ethan Tran on 4/6/25.
//

import SwiftUI

struct ExerciseCategoryListView: View {
    @State private var categories: [ExerciseCategory] = []

    var body: some View {
        NavigationView {
            List(categories) { category in
                Text(category.name)
                    .foregroundColor(.white)
                    .padding(.vertical, 8)
            }
            .navigationTitle("Muscle Groups")
            .task {
                await fetchCategories()
            }
            .background(Color.black)
        }
        .preferredColorScheme(.dark)
    }

    func fetchCategories() async {
        guard let url = URL(string: "https://wger.de/api/v2/exercisecategory/?language=2") else { return }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoded = try JSONDecoder().decode(ExerciseCategoryResponse.self, from: data)
            categories = decoded.results
        } catch {
            print("Failed to fetch categories: \(error)")
        }
    }
}



#Preview {
    ExerciseCategoryListView()
}
