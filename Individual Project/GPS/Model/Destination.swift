//
//  Destination.swift
//  Individual Project
//
//  Created by chan yuk han on 25/8/2024.
//

import SwiftData
import MapKit

@Model
class Destination {
    var name: String
    var latitude: Double?
    var longitude: Double?
    var latitudeDelta: Double?
    var longitudeDelta: Double?
    @Relationship(deleteRule: .cascade)
    var placemarks: [ToileLocation] = []
    
    init(name: String, latitude: Double? = nil, longitude: Double? = nil, latitudeDelta: Double? = nil, longitudeDelta: Double? = nil) {
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
        self.latitudeDelta = latitudeDelta
        self.longitudeDelta = longitudeDelta
    }
    
    var region: MKCoordinateRegion? {
        if let latitude, let longitude, let latitudeDelta, let longitudeDelta {
            return MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: latitude, longitude: longitude),
                span: MKCoordinateSpan(latitudeDelta: latitudeDelta, longitudeDelta: longitudeDelta)
            )
        } else {
            return nil
        }
    }
}

extension Destination {
    @MainActor
    static var preview: ModelContainer {
        let container = try! ModelContainer(
            for: Destination.self,
            configurations: ModelConfiguration(
                isStoredInMemoryOnly: true
            )
        )
        let hk = Destination(
                        name: "HK",
                        latitude: 22.3069729,
                        longitude: 114.2049172,
                        latitudeDelta: 0.1,
                        longitudeDelta: 0.1
        )
        container.mainContext.insert(hk)
        var placeMarks: [ToileLocation] {
            [
                                ToileLocation(name: "publie toile", address: "HK", latitude: 22.3845222, longitude: 114.1906457),
                                ToileLocation(name: "publie toile", address: "HK", latitude: 22.3893558, longitude: 114.2022041),
                                ToileLocation(name: "publie toile", address: "HK", latitude: 22.3897259, longitude: 114.2048758),
                                ToileLocation(name: "publie toile", address: "HK", latitude: 22.3854482, longitude: 114.1919469),
                                ToileLocation(name: "publie toile", address: "HK", latitude: 22.3890697, longitude: 114.1985781),
                                ToileLocation(name: "publie toile", address: "HK", latitude: 22.3775719, longitude: 114.1961211),
                                ToileLocation(name: "publie toile", address: "HK", latitude: 22.3770306, longitude: 114.1900051),
                                ToileLocation(name: "publie toile", address: "HK", latitude: 22.319515, longitude: 114.164594),
                                ToileLocation(name: "publie toile", address: "HK", latitude: 22.320735, longitude: 114.167404),
                                ToileLocation(name: "publie toile", address: "HK", latitude: 22.320735, longitude: 114.167404),
                                ToileLocation(name: "publie toile", address: "HK", latitude: 22.317871, longitude: 114.167573),
                                ToileLocation(name: "publie toile", address: "HK", latitude: 22.318198, longitude: 114.160344),
                                ToileLocation(name: "publie toile", address: "HK", latitude: 22.317015, longitude: 114.169013),
                                ToileLocation(name: "publie toile", address: "HK", latitude: 22.3252373, longitude: 114.1675097),
                                ToileLocation(name: "publie toile", address: "HK", latitude: 22.317811, longitude: 114.194364),
                                ToileLocation(name: "publie toile", address: "HK", latitude: 22.3217732, longitude: 114.185138),
                                ToileLocation(name: "publie toile", address: "HK", latitude: 22.331564, longitude: 114.192087),
                                ToileLocation(name: "publie toile", address: "HK", latitude: 22.329535, longitude: 114.189021),
                                ToileLocation(name: "publie toile", address: "HK", latitude: 22.329736, longitude: 114.19057),
                                ToileLocation(name: "publie toile", address: "HK", latitude: 22.308862, longitude: 114.221341),
                                ToileLocation(name: "publie toile", address: "HK", latitude: 22.316512, longitude: 114.223428),
                                ToileLocation(name: "publie toile", address: "HK", latitude: 22.314198, longitude: 114.216367),
                                ToileLocation(name: "publie toile", address: "HK", latitude: 22.316039, longitude: 114.224446),
                                ToileLocation(name: "publie toile", address: "HK", latitude: 22.334339, longitude: 114.193803),
                                ToileLocation(name: "publie toile", address: "HK", latitude: 22.334617, longitude: 114.196917),
                                ToileLocation(name: "publie toile", address: "HK", latitude: 22.323441, longitude: 114.162177),
                                ToileLocation(name: "publie toile", address: "HK", latitude: 22.3026378, longitude: 114.1888447),
                                ToileLocation(name: "publie toile", address: "HK", latitude: 22.273194, longitude: 114.242048),
                                ToileLocation(name: "publie toile", address: "HK", latitude: 22.281296, longitude: 114.22327),
                                ToileLocation(name: "publie toile", address: "HK", latitude: 22.2740094, longitude: 114.1623349),
            ]
        }
        placeMarks.forEach {placemark in
            hk.placemarks.append(placemark)
        }
        return container
    }
}
