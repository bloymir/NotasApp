//
//  Sec17_NotasAppApp.swift
//  Sec17-NotasApp
//
//  Created by nelson tapia on 29-08-23.
//

import SwiftUI

@main
struct Sec17_NotasAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
