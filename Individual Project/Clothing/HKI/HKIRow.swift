//
//  HKIRow.swift
//  Individual Project
//
//  Created by chan yuk han on 8/5/2024.
//

import SwiftUI

struct HKIIRow: View {
    var hki: HKI
    
    var body: some View {
        HStack {
            hki.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(hki.name)

            Spacer()
        }
    }
    
}

#Preview {
    Group {
        HKIIRow(hki: hkis[0])
        HKIIRow(hki: hkis[1])
    }
}
