//
//  ToilePlacemark.swift
//  Individual Project
//
//  Created by chan yuk han on 25/8/2024.
//

import SwiftData
import MapKit

@Model
class ToileLocation {
    var name: String
    var address: String
    var latitude: Double
    var longitude: Double
    var destination: Destination?
    
    init(name: String, address: String, latitude: Double, longitude: Double) {
        self.name = name
        self.address = address
        self.latitude = latitude
        self.longitude = longitude
    }
    
    var coordinate: CLLocationCoordinate2D {
        .init(latitude: latitude, longitude: longitude)
    }
}
