//
//  HousingListShowImageView.swift
//  test
//
//  Created by chan yuk han on 8/9/2024.
//

import Foundation
import SwiftUI

struct HousingListImageView: View {
    let listing: Listing
    
    var body: some View {
        TabView {
            ForEach(listing.imageList, id: \.self) { image in
                Image(image)
                    .resizable()
                    .scaledToFit()
            }
        }
        .tabViewStyle(.page)
    }
}

#Preview {
    HousingListImageView(listing: HousingData.shared.listings[0])
}
