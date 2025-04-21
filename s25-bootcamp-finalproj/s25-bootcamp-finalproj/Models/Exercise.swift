//
//  Exercise.swift
//  s25-bootcamp-finalproj
//
//  Created by Ethan Tran on 4/6/25.
//
import Foundation


struct Exercise: Identifiable, Decodable {
    let id: Int
    let name: String
    let description: String
}

struct ExerciseInfoResponse: Decodable {
    let count: Int
    let results: [ExerciseInfo]
}

struct ExerciseInfo: Decodable {
    let id: Int
    let translations: [Translation]
}

struct Translation: Decodable {
    let name: String
    let description: String
}
