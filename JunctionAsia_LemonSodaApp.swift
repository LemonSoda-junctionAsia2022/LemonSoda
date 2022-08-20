//
//  JunctionAsia_LemonSodaApp.swift
//  JunctionAsia_LemonSoda
//
//  Created by 지준용 on 2022/08/20.
//

import SwiftUI

@main
struct JunctionAsia_LemonSodaApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
