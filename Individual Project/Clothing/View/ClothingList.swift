//
//  ClothingList.swift
//  Individual Project
//
//  Created by chan yuk han on 10/9/2024.
//

//import Foundation
//import SwiftUI
//
//struct ClothingList: View {
//    
//    @State private var searchname = ""
//    
//    var body: some View {
//        NavigationSplitView {
//            List(clothings) { clothing in
//                NavigationLink {
//                    ClothingDetail(clothing: clothing)
//                } label: {
//                     ClothingRow(clothing: clothing)
//                }
//            }
//            .navigationTitle("HK Shoping mall")
//            .searchable(text: $searchname, prompt: "Search shopping mall")
//        }
//        .preferredColorScheme(.dark)
//    }
//    
//}
//
//#Preview {
//    ClothingList()
//}


import SwiftUI

struct ClothingList: View {

    @State private var searchname = ""

    var body: some View {
        NavigationView {
            List(clothings) { clothing in
                NavigationLink {
                    ClothingDetail(clothing: clothing)
                } label: {
                    ClothingRow(clothing: clothing)
                }
            }
            .navigationTitle("HK Shoping mall")
            .searchable(text: $searchname, prompt: "Search shopping mall")
        }
        .preferredColorScheme(.dark)
    }

}

#Preview {
    ClothingList()
}
