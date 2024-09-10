//
//  HousingListDetailView.swift
//  test
//
//  Created by chan yuk han on 8/9/2024.
//

import Foundation
import SwiftUI
import MapKit

struct HousingListDetailView: View {
    @Environment(\.dismiss) var dismiss
    let listing: Listing
    @State private var cameraPosition: MapCameraPosition
    
    init(listing: Listing) {
        self.listing = listing
        
        let region  = MKCoordinateRegion(
            center: listing.area == "Kowloon" ? .kowloon: .NewTerritories,
            span: MKCoordinateSpan (latitudeDelta: 0.1, longitudeDelta: 0.1)
        )
        self._cameraPosition = State(initialValue: .region(region))
    }
    
//    init(listing: Listing) {
//        self.listing = listing
//        
//        let region  = MKCoordinateRegion(
//            center: listing.area == "Los Angeles" ? .losAngeles: .miami,
//            span: MKCoordinateSpan (latitudeDelta: 0.1, longitudeDelta: 0.1)
//        )
//        self._cameraPosition = State(initialValue: .region(region))
//    }
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .topLeading) {
                HousingListImageView(listing: listing)
                    .frame(height: 320)
                
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.black)
                        .background {
                            Circle()
                                .fill(.white)
                                .frame(width: 32, height: 32)
                        }
                        .padding(32)
                }
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text(listing.title)
                    .font(.title)
                    .fontWeight(.semibold)
                
                VStack(alignment: .leading) {
                    HStack(spacing: 2) {
                        
                        Text("\(listing.rating)")
                        
                        Image(systemName: "star.fill")
                        
                        Text("hotel")
                    }
                    .foregroundStyle(.black)
                    
                    Text("\(listing.area), \(listing.zone)")
                }
                .font(.footnote)
            }
            .padding(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Divider()
            
            VStack(alignment: .leading, spacing: 16) {
                Text("What this place offers")
                    .font(.headline)
                
                ForEach(listing.amenities) { amenity in
                    HStack {
                        Image (systemName: amenity.imageName)
                            .frame(width: 32)
                        
                        Text(amenity.title)
                            .font(.footnote)
                        
                        Spacer()
                    }
                }
            }
            .padding()
            
            Divider()
            
            VStack(alignment: .leading, spacing: 16) {
                Text("Around location")
                    .font(.headline)
                
                Map(position: $cameraPosition)
                    .frame(height: 200)
                    .clipShape (RoundedRectangle(cornerRadius: 12))
            }
            .padding()
        }
        .ignoresSafeArea()
        
        
    }
}

#Preview {
    HousingListDetailView(listing: HousingData.shared.listings[0])
}
