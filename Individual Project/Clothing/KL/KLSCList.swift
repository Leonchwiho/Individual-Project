//
//  KLSCList.swift
//  Individual Project
//
//  Created by chan yuk han on 27/3/2024.
//

import SwiftUI

struct KLSCList: View {
    var body: some View {
        NavigationSplitView {
            List(klscs) { klsc in
                NavigationLink {
                    KLSCDetail(klsc: klsc)
                } label: {
                     KLSCIRow(klsc: klsc)
                }
            }
            .navigationTitle("Kowloon Shoping mall")
        } detail: {
            Text("Select a Shopping centre")
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    KLSCList()
}
