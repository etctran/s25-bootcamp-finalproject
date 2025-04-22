//
//  WorkoutSession.swift
//  s25-bootcamp-finalproj
//
//  Created by Ethan Tran on 4/6/25.
//



import Foundation

struct WorkoutSession: Identifiable, Codable {
    var id = UUID()
    var date: Date
    var exercises: [Workout]
}
