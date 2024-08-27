//
//  MapLocation.swift
//  Individual Project
//
//  Created by chan yuk han on 21/8/2024.
//

import Foundation
import CoreLocation
import MapKit

class RouteLocation: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    private var routeLocation = CLLocationManager()
    @Published var routeregion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 34.811284, longitude: -116.166_860), span: MKCoordinateSpan (latitudeDelta: 0.005, longitudeDelta: 0.005)
    )
    
    @Published var userLocation: CLLocationCoordinate2D?
    private var geocoder = CLGeocoder()
    @Published var userAddress: String?
    
    
    override init() {
        super.init()
        
        
        routeLocation.delegate = self
        routeLocation.desiredAccuracy = kCLLocationAccuracyBest
        routeLocation.requestWhenInUseAuthorization()
        routeLocation.startUpdatingLocation()
    }
    
    func routeLocation(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let location = locations.first else {return}
        userLocation = location.coordinate
        routeregion = MKCoordinateRegion(
            center: location.coordinate,
            span: MKCoordinateSpan (latitudeDelta: 0.005, longitudeDelta: 0.005)
        )
        
        geocoder.reverseGeocodeLocation (location) {
            placemarks, error in
            if error != nil {
                return
            }
            guard let placemark = placemarks?.first else {
                return
            }
            
            var addressString = ""
            
            if let name = placemark.name {
                addressString += "\(name),"
            }
            
            if let name = placemark.thoroughfare {
                addressString += "\(name),"
            }
            
            if let name = placemark.locality {
                addressString += "\(name),"
            }
            
            if let name = placemark.administrativeArea {
                addressString += "\(name),"
            }
            
            if let name = placemark.country {
                addressString += "\(name)"
            }
            
            self.userAddress = addressString
        }
        
    }
    
}
