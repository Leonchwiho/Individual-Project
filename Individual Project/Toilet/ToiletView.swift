//
//  ToiletView.swift
//  Individual Project
//
//  Created by chan yuk han on 20/5/2024.
//

import SwiftUI
import MapKit

struct ToiletView: View {
    
    struct AnnotatedItem : Identifiable {
        let id = UUID()
        let name : String
        var coordinate : CLLocationCoordinate2D
    }
    
    @State private var pointOfInterest = [
        AnnotatedItem(name: "1", coordinate: .init(latitude: 22.3845222, longitude: 114.1906457)),
        AnnotatedItem(name: "2", coordinate: .init(latitude: 22.3893558, longitude: 114.2022041)),
        AnnotatedItem(name: "3", coordinate: .init(latitude: 22.3897259, longitude: 114.2048758)),
        AnnotatedItem(name: "4", coordinate: .init(latitude: 22.3854482, longitude: 114.1919469)),
        AnnotatedItem(name: "5", coordinate: .init(latitude: 22.3890697, longitude: 114.1985781)),
        AnnotatedItem(name: "6", coordinate: .init(latitude: 22.3775719, longitude: 114.1961211)),
        AnnotatedItem(name: "7", coordinate: .init(latitude: 22.3770306, longitude: 114.1900051))
    ]
    
    @State private var region: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 22.3821828, longitude: 114.1962487), span: MKCoordinateSpan(latitudeDelta: 0.025, longitudeDelta: 0.025))
    
    var body: some View {
        
        Map(coordinateRegion: $region, annotationItems: pointOfInterest) {
            item in
            MapMarker(coordinate: item.coordinate)
            
        }
    }
}

#Preview {
    ToiletView()
}
