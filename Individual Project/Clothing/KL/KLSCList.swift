//
//  KLSCList.swift
//  Individual Project
//
//  Created by chan yuk han on 27/3/2024.
//

import SwiftUI

struct KLSCList: View {
    
    @State private var searchname = ""
    
    var body: some View {
        NavigationView {
            List(klscs) { klsc in
                NavigationLink {
                    KLSCDetail(klsc: klsc)
                } label: {
                     KLSCIRow(klsc: klsc)
                }
            }
            .navigationTitle("Kowloon Shoping mall")
            .searchable(text: $searchname, prompt: "Search shopping mall")
        }
        .preferredColorScheme(.dark)
        }
        
    }

#Preview {
    KLSCList()
}
