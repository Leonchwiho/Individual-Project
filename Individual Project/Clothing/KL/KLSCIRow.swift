//
//  KLSCIRow.swift
//  Individual Project
//
//  Created by chan yuk han on 27/3/2024.
//

import SwiftUI

struct KLSCIRow: View {
    var klsc: KLSC
    
    var body: some View {
        HStack {
            klsc.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(klsc.name)


            Spacer()
        }
    }
    
}

#Preview {
    Group {
        KLSCIRow(klsc: klscs[0])
        KLSCIRow(klsc: klscs[1])
    }
}
