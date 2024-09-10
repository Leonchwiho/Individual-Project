//
//  ClothingList.swift
//  Individual Project
//
//  Created by chan yuk han on 10/9/2024.
//

import Foundation
import SwiftUI

struct ClothingList: View {
    var body: some View {
        NavigationSplitView {
            List(clothings) { clothing in
                NavigationLink {
                    ClothingDetail(clothing: clothing)
                } label: {
                     ClothingRow(clothing: clothing)
                }
            }
            .navigationTitle("HK Shoping mall")
        } detail: {
            Text("Select a Shopping centre")
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ClothingList()
}
