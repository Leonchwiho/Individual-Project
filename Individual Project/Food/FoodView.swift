//
//  FoodView.swift
//  Individual Project
//
//  Created by chan yuk han on 21/5/2024.
//

import Foundation
import SwiftUI

struct FoodView: View {

    var body: some View {
        
        TabView {
            
//            HKIList().tabItem({
//                Text("HKI")
//            }).tag(0)
            
            KLSCList().tabItem({
                Text("KL")
            }).tag(1)
        }
        
    }
}

#Preview {
    FoodView()
}
