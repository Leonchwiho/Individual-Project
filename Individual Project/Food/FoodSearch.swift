//
//  FoodSearch.swift
//  Individual Project
//
//  Created by chan yuk han on 4/9/2024.
//

import Foundation
import SwiftUI

struct FoodSearch: View {
    @Binding var text: String

    var body: some View {
        HStack {
            TextField("Search", text: $text)
                .padding(7)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal, 10)
            if !text.isEmpty {
                Button(action: {
                    text = ""
                }) {
                    Text("Cancel")
                }
            }
        }
    }
}
