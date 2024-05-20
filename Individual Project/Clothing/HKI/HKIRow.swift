//
//  HKIRow.swift
//  Individual Project
//
//  Created by chan yuk han on 8/5/2024.
//

import SwiftUI

struct HKIRow: View {
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
        HKIRow(hki: hkis[0])
        HKIRow(hki: hkis[1])
    }
}
