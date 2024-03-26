//
//  KLSCList.swift
//  Individual Project
//
//  Created by chan yuk han on 27/3/2024.
//

import SwiftUI

struct KLSCList: View {
    var body: some View {
        List(klscs, id: \.id) { klsc in
            KLSCIRow(klsc: klsc)
        }
    }
    
}

#Preview {
    KLSCList()
}
