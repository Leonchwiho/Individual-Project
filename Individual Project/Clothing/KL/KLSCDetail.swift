//
//  KLSCDetail.swift
//  Individual Project
//
//  Created by chan yuk han on 27/3/2024.
//

import SwiftUI

struct KLSCDetail: View {
    
    var klsc: KLSC
    
    var body: some View {
        ScrollView {
            MapView(coordinate: klsc.locationCoordinate)
                .frame(height: 300)
            
            RoundImage(image: klsc.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                Text(klsc.name)
                    .font(.title)
                
                HStack {
                    Text(klsc.address)
                    Spacer()
                    Text(klsc.region)
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
                
                Divider()
                
                Text("About \(klsc.name)")
                    .font(.title2)
                Text(klsc.description)
            }
            .padding()
        }
        .navigationTitle(klsc.name)
        .navigationBarTitleDisplayMode(.inline)
    }
    
}

#Preview {
    KLSCDetail(klsc: klscs[0])
}
