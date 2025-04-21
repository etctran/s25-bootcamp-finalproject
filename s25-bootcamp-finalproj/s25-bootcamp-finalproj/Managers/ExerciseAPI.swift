//
//  ExerciseAPI.swift
//  s25-bootcamp-finalproj
//
//  Created by Ethan Tran on 4/6/25.
//
import Foundation
import SwiftUI

class ExerciseManager {
    static func fetchExercises() async throws -> [Exercise] {
        guard let url = URL(string: "https://wger.de/api/v2/exerciseinfo/?language=2&limit=50") else {
            print("Invalid URL in ExerciseManager.fetchExercises")
            return []
        }

        var request = URLRequest(url: url)
        request.setValue("Token 86daba0805bfbb59cdf17421e9f632c9966f25bc", forHTTPHeaderField: "Authorization")

        do {
            let (data, response) = try await URLSession.shared.data(for: request)

            if let httpResponse = response as? HTTPURLResponse {
                print("HTTP Status Code: \(httpResponse.statusCode)")
            }

            let decoded = try JSONDecoder().decode(ExerciseInfoResponse.self, from: data)

            return decoded.results.compactMap { info in
                guard let translation = info.translations.first else { return nil }
                return Exercise(id: info.id, name: translation.name, description: translation.description)
            }
        } catch {
            print("Error during fetch or decoding in ExerciseManager.fetchExercises: \(error)")
            return []
        }
    }
}

#Preview {
    ContentView()
}
