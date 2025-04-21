//
//  ExerciseCategoryListView.swift
//  s25-bootcamp-finalproj
//
//  Created by Ethan Tran on 4/6/25.
//

import SwiftUI

struct ExerciseCategoryListView: View {
    let categories = ["Abs", "Back", "Chest", "Legs", "Arms", "Shoulders", "Cardio"]

    var body: some View {
        NavigationView {
            List(categories, id: \.self) { category in
                NavigationLink(destination: ExerciseListByCategoryView(category: category)) {
                    Text(category)
                        .foregroundColor(.white)
                        .padding(.vertical, 8)
                }
            }
            .navigationTitle("Muscle Groups")
            .background(Color.black)
        }
        .preferredColorScheme(.dark)
    }
}



#Preview {
    ExerciseCategoryListView()
}
