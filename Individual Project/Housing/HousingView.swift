//
//  HousingView.swift
//  Individual Project
//
//  Created by chan yuk han on 10/9/2024.
//

import SwiftUI

struct HousingView: View {
    @StateObject var viewModel = HousingViewModel(service: HousingService())
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 32) {
                    ForEach(viewModel.listings) { listing in
                        NavigationLink(value: listing) {
                            HousingListItemView(listing: listing)
                                .frame(height: 400)
                                .clipShape (RoundedRectangle (cornerRadius: 10))
                        }
                    }
                }
                .padding()
            }
            .navigationDestination(for: Listing.self) { listing in
                HousingListDetailView(listing: listing)
                    .navigationBarBackButtonHidden()
            }
        }
    }
}

#Preview {
    HousingView()
}
