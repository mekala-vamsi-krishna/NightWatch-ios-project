//
//  Action_NightWatchApp.swift
//  Action NightWatch
//
//  Created by Mekala Vamsi Krishna on 29/06/21.
//

import SwiftUI

@main
struct Action_NightWatchApp: App {
    @StateObject private var nightWatchTasks = NightWatchTasks()
    
    var body: some Scene {
        WindowGroup {
            ContentView(nightWatchTasks: NightWatchTasks())
        }
    }
}
