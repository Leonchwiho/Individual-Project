//
//  Food.swift
//  Individual Project
//
//  Created by chan yuk han on 3/9/2024.
//

import Foundation

struct Restaurant: Identifiable {
    let id = UUID()
    let name: String
    let location: String
    let image: String
    let reviews: [String]
}

let Restaurants = [
    Restaurant(name: "Isaba Taifu", location: "G/F, 39 Fife Street, Kin Wong Mansion, Mong Kok", image: "IT", reviews: ["amazing tsukemen!! 10/10", "Loved the soup and ramen 10/10"]),
    Restaurant(name: "M.Y Majesty", location: "G/F, 15 Fuk Wa Street, Sham Shui Po", image: "MYM", reviews: ["big portion and tast good 9/10", "good value for money and great tasting beverages 10/10"]),
    Restaurant(name: "Tendon Tenya", location: "Shop G02, G/F, Maritime Square 1, 31-33 Tsing King Road, Tsing Yi", image: "TT", reviews: ["Best burgers in town!", "Friendly staff."]),
    Restaurant(name: "Kikanbo", location: "G/F, 20 Cameron Road, Tsim Sha Tsui", image: "KKB", reviews: ["Best burgers in town!", "Friendly staff."]),
    Restaurant(name: "Angus Cafe", location: "Shop 2, G/F, Victor Court, 14-28 Wang On Road, Fortress Hill, North Point", image: "AC", reviews: ["Best burgers in town!", "Friendly staff."]),
    Restaurant(name: "Camper's", location: "G/F, Chung Hing Mansion, 13 Pan Hoi Street, Quarry Bay", image: "CPS", reviews: ["Best burgers in town!", "Friendly staff."]),
    Restaurant(name: "Downstairs Cafe", location: "G/F, 967 King's Road, Quarry Bay", image: "DCHK", reviews: ["Best burgers in town!", "Friendly staff."]),
    Restaurant(name: "Ebina Tsukemen", location: "Shop 20, G/F, Manor Centre, 213 Un Chau Street, Cheung Sha Wan", image: "ET", reviews: ["Best burgers in town!", "Friendly staff."]),
    Restaurant(name: "Korean Taste", location: "G/F, 100-104 Tsat Tsz Mui Road, North Point", image: "KT", reviews: ["Best burgers in town!", "Friendly staff."]),
    Restaurant(name: "Alishan Food Station", location: "Shop 6, G/F, Greenfield Garden Block 1, 4 Cheung Wan Street, Tsing Yi", image: "AFS", reviews: ["Best burgers in town!", "Friendly staff."]),
    Restaurant(name: "Gees@Waterfront", location: "Shop C2, 20/F, Gatewayts, 8 Cheung Fai Road, Tsing Yi", image: "GW", reviews: ["Best burgers in town!", "Friendly staff."]),
    Restaurant(name: "壹家店", location: " Shop A4, G/F, Smiling Plaza, 162-188 Un Chau Street, Cheung Sha Wan", image: "ooo", reviews: ["Fresh sushi!", "A bit pricey, but worth it."])
]
