//
//  ListItemView.swift
//  Individual Project
//
//  Created by chan yuk han on 8/9/2024.
//

import Foundation
import SwiftUI

struct HousingListItemView: View {
    let listing: Listing
    
    var body: some View {
        VStack(spacing: 8) {
            // images
            
            HousingListImageView(listing: listing)
                .frame(height: 320)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            // listing details
            
            HStack(alignment: .top) {
                // details
                VStack(alignment: .leading) {
                    Text("\(listing.area), \(listing.zone)")
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                    
                    Text("\(listing.address)")
                        .foregroundStyle(.gray)
                    
                    HStack(spacing: 4) {
                        Text("Around $\(listing.pricePerNight)")
                            .fontWeight(.semibold)
                        Text("night")
                    }
                    .foregroundStyle(.black)
                }
                
                Spacer()
                
                // rating
                
                Text("\(listing.rating)")
                
                HStack(spacing: 2) {
                    Image(systemName: "star.fill")
                    
                    Text("hotel")
                }
            }
            .font(.footnote)
        }
    }
    
}

#Preview {
    HousingListItemView(listing: HousingData.shared.listings[0])
}
