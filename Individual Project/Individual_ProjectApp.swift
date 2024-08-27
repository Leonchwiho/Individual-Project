//
//  Individual_ProjectApp.swift
//  Individual Project
//
//  Created by chan yuk han on 19/3/2024.
//

import SwiftUI
import SwiftData

@main
struct Individual_ProjectApp: App {
    @State private var locationManager = RouteLocationManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Destination.self)
        .environment(locationManager)
    }
}
