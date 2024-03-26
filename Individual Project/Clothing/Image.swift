//
//  KImage.swift
//  Individual Project
//
//  Created by chan yuk han on 26/3/2024.
//

import SwiftUI

struct KImage: View {
    var image : Image
    
    var body: some View {
        image
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .overlay {
                Circle().stroke(.white,
                                 lineWidth: 4)
            }
            .shadow(radius:7)
    }
}

#Preview {
    KImage(image: Image("KCP"))
}
