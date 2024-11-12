//
//  iosLabSystemApp.swift
//  iosLabSystem
//
//  Created by yatziri on 06/11/24.
//

import SwiftUI
import SwiftData

@main
struct iosLabSystemApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Usuario.self, Equipo.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
