//
//  Workout.swift
//  s25-bootcamp-finalproj
//
//  Created by Ethan Tran on 4/6/25.
//

import Foundation

struct Workout: Identifiable, Codable {
    var id = UUID()
    var name: String
    var muscleGroup: String
    var sets: [SetEntry]
    var date: Date
}

