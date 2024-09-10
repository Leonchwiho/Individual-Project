//
//  LocationView.swift
//  Individual Project
//
//  Created by chan yuk han on 13/8/2024.
//

import SwiftUI
import CoreLocation
import MapKit


struct LocationView: View {
    
    @StateObject var locationModel = LocationModel()
    @State var coordinateRegion : MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 0, longitude: 0),
                                                                          span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
    var body: some View {
        VStack {
            
            if locationModel.authorizationStatus == .authorizedWhenInUse ||
                locationModel.authorizationStatus == .authorizedAlways {
                
                Text("Lat: \(locationModel.lastLocation?.coordinate.latitude ?? 0)")
                Text("Lng: \(locationModel.lastLocation?.coordinate.longitude ?? 0)")
                
                Map(coordinateRegion: $locationModel.coordinateRegion)
                
            } else {
                Button("Request Permisison", action: {
                    locationModel.requestPermission()
                })
            }
        }
        .padding()
    }
}
    
#Preview {
    LocationView()
}
