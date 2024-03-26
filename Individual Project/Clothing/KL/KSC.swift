//
//  KSC.swift
//  Individual Project
//
//  Created by chan yuk han on 27/3/2024.
//

import Foundation
import SwiftUI

struct KSC: Hashable, Codable {
    var id: Int
    var name: String
    var address: String
    var region: String
    var description: String
}

//    private var KSCImageName: String
//    var image: Image {
//        Image(KSCImageName)
//    }

    private var imageName: String
    var image: Image {
        Image(imageName)
    }

