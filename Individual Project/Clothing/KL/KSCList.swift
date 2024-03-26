//
//  KSCView.swift
//  Individual Project
//
//  Created by chan yuk han on 24/3/2024.
//

import SwiftUI

struct KSCView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .font(.title)
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

#Preview {
    KSCView()
}
