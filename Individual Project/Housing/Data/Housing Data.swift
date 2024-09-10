//
//  Housing Dateswift.swift
//  test
//
//  Created by chan yuk han on 8/9/2024.
//

import Foundation

class HousingData {
    static let shared = HousingData()
    
    var listings: [Listing] = [
        .init(
            id: NSUUID().uuidString,
            imageList: ["HT1", "HT2", "HT3"],
            area: "Kowloon",
            zone: "Tsim Sha Tsui",
            rating: 5,
            address: "The Peninsula Hong Kong, Salisbury Road",
            pricePerNight: 12050,
            title: "The Peninsula Hong Kong",
            amenities: [.wifi, .alarmSystem, .balcony, .laundry, .tv],
            latitude: 22.2951024,
            longitude:  114.1692788
        ),
        .init(
            id: NSUUID().uuidString,
            imageList: ["HT4", "HT5", "HT6"],
            area: "New Territories",
            zone: "Tsuen Wan",
            rating: 5,
            address: "8 Yeung Uk Road",
            pricePerNight: 3435,
            title: "Nina Hotal Tsuen Wan West",
            amenities: [.wifi, .alarmSystem, .balcony, .laundry, .tv],
            latitude: 22.3685909,
            longitude:  114.110402
        ),
        .init(
            id: NSUUID().uuidString,
            imageList: ["HT7", "HT8", "HT9"],
            area: "Kowloon",
            zone: "East Tsim Sha Tsui",
            rating: 5,
            address: "69 Mody Road, Tsimshatsui East",
            pricePerNight: 3191,
            title: "The Royal Garden",
            amenities: [.wifi, .alarmSystem, .balcony, .laundry, .tv],
            latitude: 22.2985671,
            longitude:  114.1750768
        ),
        .init(
            id: NSUUID().uuidString,
            imageList: ["HT10", "HT11", "HT12"],
            area: "Kowloon",
            zone: "Prince Edward",
            rating: 5,
            address: "193 Prince Edward Road West",
            pricePerNight: 2765,
            title: "Royal Plaza Hotal",
            amenities: [.wifi, .alarmSystem, .balcony, .laundry, .tv],
            latitude: 22.2951024,
            longitude:  114.1692788
        ),
        .init(
            id: NSUUID().uuidString,
            imageList: ["HT13", "HT14", "HT15"],
            area: "Kowloon",
            zone: "MongKoK",
            rating: 5,
            address: "555 Shanghai Street",
            pricePerNight: 5807,
            title: "Cordis Hotel",
            amenities: [.wifi, .alarmSystem, .balcony, .laundry, .tv],
            latitude: 22.2951024,
            longitude:  114.1692788
        ),
        .init(
            id: NSUUID().uuidString,
            imageList: ["HT16", "HT17", "HT18"],
            area: "Kowloon",
            zone: "Tsim Sha Tsui",
            rating: 5,
            address: "84 Hart Avenue",
            pricePerNight: 5975,
            title: "Mondrian",
            amenities: [.wifi, .alarmSystem, .balcony, .laundry, .tv],
            latitude: 22.2951024,
            longitude:  114.1692788
        ),
        .init(
            id: NSUUID().uuidString,
            imageList: ["HT19", "HT20", "HT21"],
            area: "Kowloon",
            zone: "Tsim Sha Tsui",
            rating: 5,
            address: "17 Science Museum Road",
            pricePerNight: 3700,
            title: "Hotel Icon",
            amenities: [.wifi, .alarmSystem, .balcony, .laundry, .tv],
            latitude: 22.2951024,
            longitude:  114.1692788
        ),
        .init(
            id: NSUUID().uuidString,
            imageList: ["HT22", "HT23", "HT24"],
            area: "Kowloon",
            zone: "Tsim Sha Tsui",
            rating: 5,
            address: "39 Kimberley Road",
            pricePerNight: 4703,
            title: "The Luxe Manor",
            amenities: [.wifi, .alarmSystem, .balcony, .laundry, .tv],
            latitude: 22.2951024,
            longitude:  114.1692788
        )
        ]
}
