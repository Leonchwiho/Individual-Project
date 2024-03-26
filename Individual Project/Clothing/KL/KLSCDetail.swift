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
        VStack {
            MapView(coordinate: klsc.locationCoordinate)
                .frame(height: 300)


            RoundImage(image: klsc.image)
                .offset(y: -130)
                .padding(.bottom, -130)


            VStack(alignment: .leading) {
                Text("Kowloon City Plaza")
                    .font(.title)


                HStack {
                    Text("128 Carpenter Road, Kowloon City")
                    Spacer()
                    Text("Kowloon")
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)


                Divider()


                Text("About Turtle Rock")
                    .font(.title2)
                Text("Descriptive text goes here.")
            }
            .padding()


            Spacer()
        }
    }
}

#Preview {
    KLSCDetail(klsc: klscs[0])
}
