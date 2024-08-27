//
//  ToiletView.swift
//  Individual Project
//
//  Created by chan yuk han on 20/5/2024.
//

import SwiftUI
import MapKit

struct ToiletView: View {
    
    struct Toilet: Identifiable {
        let id = UUID()
        let name: String
        var coordinate: CLLocationCoordinate2D
    }
    
    @State private var toiletpoint = [
        Toilet(name: "1", coordinate: .init(latitude: 22.3845222, longitude: 114.1906457)),
        Toilet(name: "2", coordinate: .init(latitude: 22.3893558, longitude: 114.2022041)),
        Toilet(name: "3", coordinate: .init(latitude: 22.3897259, longitude: 114.2048758)),
        Toilet(name: "4", coordinate: .init(latitude: 22.3854482, longitude: 114.1919469)),
        Toilet(name: "5", coordinate: .init(latitude: 22.3890697, longitude: 114.1985781)),
        Toilet(name: "6", coordinate: .init(latitude: 22.3775719, longitude: 114.1961211)),
        Toilet(name: "7", coordinate: .init(latitude: 22.3770306, longitude: 114.1900051)),
        Toilet(name: "8", coordinate: .init(latitude: 22.319515, longitude: 114.164594)),
        Toilet(name: "9", coordinate: .init(latitude: 22.320735, longitude: 114.167404)),
        Toilet(name: "10", coordinate: .init(latitude: 22.317871, longitude: 114.167573)),
        Toilet(name: "11", coordinate: .init(latitude: 22.318198, longitude: 114.160344)),
        Toilet(name: "12", coordinate: .init(latitude: 22.317015, longitude: 114.169013)),
        Toilet(name: "13", coordinate: .init(latitude: 22.3252373, longitude: 114.1675097)),
        Toilet(name: "14", coordinate: .init(latitude: 22.317811, longitude: 114.194364)),
        Toilet(name: "15", coordinate: .init(latitude: 22.3217732, longitude: 114.185138)),
        Toilet(name: "16", coordinate: .init(latitude: 22.331564, longitude: 114.192087)),
        Toilet(name: "17", coordinate: .init(latitude: 22.329535, longitude: 114.189021)),
        Toilet(name: "18", coordinate: .init(latitude: 22.329736, longitude: 114.19057)),
        Toilet(name: "19", coordinate: .init(latitude: 22.308862, longitude: 114.221341)),
        Toilet(name: "20", coordinate: .init(latitude: 22.316512, longitude: 114.223428)),
        Toilet(name: "21", coordinate: .init(latitude: 22.314198, longitude: 114.216367)),
        Toilet(name: "22", coordinate: .init(latitude: 22.316039, longitude: 114.224446)),
        Toilet(name: "23", coordinate: .init(latitude: 22.334339, longitude: 114.193803)),
        Toilet(name: "24", coordinate: .init(latitude: 22.334617, longitude: 114.196917)),
        Toilet(name: "25", coordinate: .init(latitude: 22.323441, longitude: 114.162177)),
        Toilet(name: "26", coordinate: .init(latitude: 22.3026378, longitude: 114.1888447)),
        Toilet(name: "27", coordinate: .init(latitude: 22.273194, longitude: 114.242048)),
        Toilet(name: "28", coordinate: .init(latitude: 22.281296, longitude: 114.22327)),
        Toilet(name: "29", coordinate: .init(latitude: 22.2740094, longitude: 114.1623349))
    ]
    
    @State private var region: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 22.3908956, longitude: 114.2), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    
    var body: some View {
        
        Map(coordinateRegion: $region, annotationItems: toiletpoint) {
            item in
            MapMarker(coordinate: item.coordinate)
            
        }
    }
}

#Preview {
    ToiletView()
}
