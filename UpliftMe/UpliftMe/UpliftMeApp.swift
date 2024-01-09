//
//  UpliftMeApp.swift
//  UpliftMe
//
//  Created by Shabano Yousafzai on 2024-01-05.
//

import SwiftUI

@main
struct UpliftMeApp: App {
    let persistenceController = PersistenceController.shared
    @Environment(\.scenePhase) var scenePhase
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
        .onChange(of: scenePhase) { _ in
            persistenceController.save()
        }
    }
}
