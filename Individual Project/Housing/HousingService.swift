//
//  HousingService.swift
//  test
//
//  Created by chan yuk han on 9/9/2024.
//

import Foundation

class HousingService {
    func fetchListings() async throws -> [Listing] {
        return HousingData.shared.listings
    }
}
