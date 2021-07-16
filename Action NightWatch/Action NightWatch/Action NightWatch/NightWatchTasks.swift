//
//  NightWatchTasks.swift
//  Action NightWatch
//
//  Created by Mekala Vamsi Krishna on 29/06/21.
//

import Foundation

class NightWatchTasks: ObservableObject {
    @Published var nightlyTasks = [
        
        Task(name: "Check all windows", isComplete: false, lastCompleted: nil),
        Task(name: "Check all doors", isComplete: false, lastCompleted: nil),
        Task(name: "Check that the safe is locked", isComplete: false, lastCompleted: nil),
        Task(name: "Check the mailbox", isComplete: false, lastCompleted: nil),
        Task(name: "Inspect security cameras", isComplete: false, lastCompleted: nil),
        Task(name: "Clear ice from sidewalks", isComplete: false, lastCompleted: nil),
        Task(name: "Document \"strange and unusual\" occurences", isComplete: false, lastCompleted: nil),

    ]

    @Published var weeklyTasks = [
        Task(name: "Check inside all vacant rooms", isComplete: false, lastCompleted: nil),
        Task(name: "CWalk the perimeter of property", isComplete: false, lastCompleted: nil),
        
    ]

    @Published var monthlyTasks = [
        Task(name: "Test security alarm", isComplete: false, lastCompleted: nil),
        Task(name: "Test motion detectors", isComplete: false, lastCompleted: nil),
        Task(name: "Test smoke alarms", isComplete: false, lastCompleted: nil),

    ]
}
