import Foundation

struct ExerciseCategoryResponse: Decodable {
    let results: [ExerciseCategory]
}

struct ExerciseCategory: Decodable, Identifiable {
    let id: Int
    let name: String
}

struct Exercise: Identifiable, Decodable {
    let id: Int
    let name: String
}
