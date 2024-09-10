//
//  GPSView.swift
//  Individual Project
//
//  Created by chan yuk han on 13/8/2024.
//

import SwiftUI
import SwiftData

struct GPSView: View {
    @State private var locationManager = RouteLocationManager()
    
    var body: some View {

        TabView {
            if locationManager.isAuthorized {
                LocationView().tabItem({
                    Text("Location")
                }).tag(0)
                
                ToiletView().tabItem({
                    Text("Toilet")
                }).tag(1)
                
                RouteMapView().tabItem({
                    Text("RouteMap")
                }).tag(2)
            } else {
                Text("Need to allow the location policy")
            }
        }
        .modelContainer(for: Destination.self)
        .environment(locationManager)
    }
}

#Preview {
    GPSView()
}
