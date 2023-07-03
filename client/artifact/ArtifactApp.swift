//
//  artifactApp.swift
//  artifact
//
//  Created by David Chavez-Grant on 7/3/23.
//

import SwiftUI

@main
struct artifactApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            HomePage(messageText: "")
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
