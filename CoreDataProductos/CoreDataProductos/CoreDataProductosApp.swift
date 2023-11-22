//
//  CoreDataProductosApp.swift
//  CoreDataProductos
//
//  Created by Angel García on 21/11/23.
//

import SwiftUI

@main
struct CoreDataProductosApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
