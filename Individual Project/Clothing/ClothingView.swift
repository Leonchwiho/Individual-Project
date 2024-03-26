//
//  ClothingView.swift
//  Individual Project
//
//  Created by chan yuk han on 23/3/2024.
//

import SwiftUI

struct ClothingView: View {
    var body: some View {

        TabView {
            
            HKIView().tabItem({
                Text("HKI")
            }).tag(0)
            
//            KLSCList(klsc: klscs[0]).tabItem({
//                Text("KL")
//            }).tag(1)
        }
        
    }
}

#Preview {
    ClothingView()
}
