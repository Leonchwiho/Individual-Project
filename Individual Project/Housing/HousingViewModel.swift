//
//  HousingViewModel.swift
//  test
//
//  Created by chan yuk han on 9/9/2024.
//

import Foundation

class HousingViewModel: ObservableObject {
    @Published var listings = [Listing]()
    private let service: HousingService
    
    init(service: HousingService) {
        self.service = service
        
        Task { await fetchListings() }
    }
    
    func fetchListings() async {
        do {
            self.listings = try await service.fetchListings()
        } catch {
            print("DEBUG: Failed to fetch listings with error: \(error.localizedDescription)")
        }
    }
}
