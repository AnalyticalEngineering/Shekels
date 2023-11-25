//
//  ShekelsApp.swift
//  Shekels
//
//  Created by J. DeWeese on 11/24/23.
//

import SwiftUI
import UserNotifications

@main
struct ShekelsApp: App {
    
    init() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if granted {
                // notification is granted
            } else {
                // display message to the user
            }
        }
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext,
                              CoreDataProvider.shared.persistentContainer.viewContext)
        }
    }
}
