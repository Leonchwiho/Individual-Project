//
//  FoodView.swift
//  Individual Project
//
//  Created by chan yuk han on 21/5/2024.
//

import Foundation
import SwiftUI

struct FoodView: View {
    @State private var searchText = ""
    @State private var restaurants = Restaurants

    var filteredRestaurants: [Restaurant] {
        if searchText.isEmpty {
            return restaurants
        } else {
            return restaurants.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }

    var body: some View {
        NavigationView {
            VStack {
                FoodSearch(text: $searchText)
                List(filteredRestaurants) { restaurant in
                    NavigationLink(destination: FoodDetailView(restaurant: restaurant)) {
                        HStack {
                            Image(restaurant.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                                .cornerRadius(5)
                            VStack(alignment: .leading) {
                                Text(restaurant.name)
                                    .font(.headline)
                                Text(restaurant.location)
                                    .font(.subheadline)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Best Restaurants")
        }
    }
}

#Preview {
    FoodView()
}
