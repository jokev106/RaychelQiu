//
//  RaychelQiuApp.swift
//  RaychelQiu
//
//  Created by Jonathan Kevin on 20/10/22.
//

import SwiftUI

@main
struct RaychelQiuApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
