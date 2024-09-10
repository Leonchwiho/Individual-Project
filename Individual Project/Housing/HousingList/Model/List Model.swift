//
//  List Model.swift
//  test
//
//  Created by chan yuk han on 8/9/2024.
//

import Foundation

struct Listing: Identifiable, Codable, Hashable {
    let id: String
    var imageList: [String]
        let area: String
        let zone: String
        var rating: Int
        let address: String
        var pricePerNight: Int
        let title: String
        var amenities: [ListingAmenities]
        let latitude: Double
        let longitude: Double
}

enum ListingAmenities: Int, Codable, Identifiable, Hashable { case pool
    case kitchen
    case wifi
    case laundry
    case tv
    case alarmSystem
    case office
    case balcony
    
    var title: String {
        switch self {
        case .pool: return "Pool"
        case .kitchen: return "Kitchen"
        case .wifi: return "Wifi"
        case .laundry: return "Laundry"
        case .tv: return "TV"
        case .alarmSystem: return "Alarm System"
        case .office: return "Office"
        case .balcony: return "Balcony"
        }
    }
    
    var imageName: String {
        switch self {
        case .pool: return "figure.pool.swim"
        case .kitchen: return "fork.knife"
        case .wifi: return "wifi"
        case .laundry: return "washer"
        case .tv: return "tv"
        case .alarmSystem: return "checkerboard.shield"
        case .office: return "pencil.and.ruler.fill"
        case .balcony: return "building"
        }
    }
    
    var id: Int { return self.rawValue }
}
