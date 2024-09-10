//
//  ClothingRow.swift
//  Individual Project
//
//  Created by chan yuk han on 10/9/2024.
//

import SwiftUI

struct ClothingRow: View {
    var clothing: Clothing
    
    var body: some View {
        HStack {
            clothing.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(clothing.name)

            Spacer()
        }
    }
    
}

#Preview {
    Group {
        ClothingRow(clothing: clothings[0])
        ClothingRow(clothing: clothings[1])
    }
}
