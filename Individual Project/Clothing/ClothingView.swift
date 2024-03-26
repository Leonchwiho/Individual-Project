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
                Text("Hong Kong Iskand")
            }).tag(0)
            
            KView().tabItem({
                Text("Kowloon")
            }).tag(1)
        }
        
    }
}

#Preview {
    ClothingView()
}
