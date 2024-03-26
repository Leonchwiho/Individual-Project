//
//  KSCDetail.swift
//  Individual Project
//
//  Created by chan yuk han on 27/3/2024.
//

import SwiftUI

struct KSCDetail: View {
//    var ksc: KSC
    
    var body: some View {
        VStack {
            MapView().frame(height: 300)
                .edgesIgnoringSafeArea(.top)
            RoundImage()
            VStack(alignment: .leading) {
                Text("test")
                    .font.title
                HStack {
                    Text("test")
                        .font(.subheadline)
                    Spacer()
                    Text("test")
                        .font(.subheadline)
                }
            }
            .padding()
        }
    }
}

#Preview {
    KSCDetail()
}
