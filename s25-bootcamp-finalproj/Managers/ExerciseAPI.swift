//
//  ExerciseAPI.swift
//  s25-bootcamp-finalproj
//
//  Created by Ethan Tran on 4/6/25.
//

import SwiftUI
import Foundation

class ExerciseManager {
    static func fetchCategories() async throws -> [ExerciseCategory] {
        guard let url = URL(string: "https://wger.de/api/v2/exercisecategory/") else {
            return []
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(ExerciseCategoryResponse.self, from: data)
        return response.results
    }
}
