//
//  Task.swift
//  Action NightWatch
//
//  Created by Mekala Vamsi Krishna on 29/06/21.
//

import Foundation

struct Task: Identifiable {
    let id = UUID()
    let name: String
    var isComplete: Bool
    var lastCompleted: Date?
}
