//
//  HoroscopeApp.swift
//  Horoscope
//
//  Created by Thinkitive on 23/10/23.
//

import SwiftUI

@main
struct HoroscopeApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
