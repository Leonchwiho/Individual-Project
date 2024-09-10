//
//  HKIDetail.swift
//  Individual Project
//
//  Created by chan yuk han on 8/5/2024.
//

//import SwiftUI
//
//struct HKIDetail: View {
//    
//    var hki: HKI
//    
//    var body: some View {
//        ScrollView {
//            MapView(coordinate: hki.locationCoordinate)
//                .frame(height: 300)
//            
//            RoundImage(image: hki.image)
//                .offset(y: -130)
//                .padding(.bottom, -130)
//            
//            VStack(alignment: .leading) {
//                Text(hki.name)
//                    .font(.title)
//                
//                HStack {
//                    Text(hki.address)
//                    Spacer()
//                    Text(hki.region)
//                }
//                .font(.subheadline)
//                .foregroundStyle(.secondary)
//                
//                Divider()
//                
//                Text("About \(hki.name)")
//                    .font(.title2)
//                Text(hki.description)
//            }
//            .padding()
//        }
//        .navigationTitle(hki.name)
//        .navigationBarTitleDisplayMode(.inline)
//    }
//    
//}
//
//#Preview {
//    HKIDetail(hki: hkis[0])
//}
