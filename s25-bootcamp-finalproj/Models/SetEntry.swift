//
//  SetEntry.swift
//  s25-bootcamp-finalproj
//
//  Created by Ethan Tran on 4/6/25.
//


import Foundation

struct SetEntry: Identifiable, Codable {
    var id = UUID()
    var reps: Int
    var weight: Int
}
