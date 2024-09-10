//
//  ClothingDetail.swift
//  Individual Project
//
//  Created by chan yuk han on 10/9/2024.
//

import Foundation
import SwiftUI

struct ClothingDetail: View {
    var clothing: Clothing
    
    var body: some View {
        ScrollView {
            MapView(coordinate: clothing.locationCoordinate)
                .frame(height: 300)
            
            RoundImage(image: clothing.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                Text(clothing.name)
                    .font(.title)
                
                HStack {
                    Text(clothing.address)
                    Spacer()
                    Text(clothing.region)
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
                
                Divider()
                
                Text("About \(clothing.name)")
                    .font(.title2)
                Text(clothing.description)
            }
            .padding()
        }
        .navigationTitle(clothing.name)
        .navigationBarTitleDisplayMode(.inline)
    }
    
}

#Preview {
    ClothingDetail(clothing: clothings[0])
}
