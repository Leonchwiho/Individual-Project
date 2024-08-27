//
//  RouteMapView.swift
//  Individual Project
//
//  Created by chan yuk han on 21/8/2024.
//

import SwiftUI
import MapKit

struct IdentifiableLocation: Identifiable {
    var id =  UUID()
    let coordnate: CLLocationCoordinate2D
    
    init(id: UUID = UUID(), coordnate: CLLocationCoordinate2D) {
        self.id = id
        self.coordnate = coordnate
    }
}

struct RouteMapView: View {
    
    @StateObject private var routeLocation = RouteLocation()
    @State private var annotations = [IdentifiableLocation]()
    
    @State private var routeregion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 22.3069729, longitude: 114.2049172), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    
    var body: some View {
        
        GeometryReader { reader in
            
            VStack{
                if #available (iOS 17.0, *) {
                    Map(initialPosition: .region (routeregion))
                } else {
                    Map(coordinateRegion: $routeLocation.routeregion, showsUserLocation: true, annotationItems: annotations){ item in
                        MapMarker(coordinate: item.coordnate)
                    }
                    .onAppear{
                        if let userLocation = routeLocation.userLocation {
                            let identificationLocation = IdentifiableLocation(coordnate: userLocation)
                            
                            annotations.append(identificationLocation)
                        }
                    }
                }
                VStack (alignment: .leading) {
                    Text(routeLocation.userAddress ?? "")
                        .font(.title2)
                }
            }
        }
        
        
    }
        
}

#Preview {
    RouteMapView()
}
