//
//  FoodDetailView.swift
//  Individual Project
//
//  Created by chan yuk han on 3/9/2024.
//

import Foundation
import SwiftUI

struct FoodDetailView: View {
    let restaurant: Restaurant
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Image(restaurant.image)
                    .resizable()
                    .scaledToFit()
                    .frame(height:300)
                Text(restaurant.location)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.bottom, 10)
                
                Text("Reviews:")
                    .font(.headline)
                    .padding(.bottom, 5)
                
                ForEach(restaurant.reviews, id: \.self) { review in Text(review)
                        .padding(.bottom, 2)
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle(restaurant.name)
        }
    }
}
