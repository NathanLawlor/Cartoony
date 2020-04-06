//
//  Cartoon.swift
//  Cartoony
//
//  Created by Nathan on 18/03/2020.
//  Copyright © 2020 Nathan. All rights reserved.
//

import Foundation

struct Cartoon {
    var name: String
    var rarity: RarityType
    var imageAsset: String
}

extension Cartoon {
    init(dict:[String:AnyObject]) {
        self.name = dict["name"] as? String ?? ""
        let rarityValue = dict["rarity"] as? String ?? ""
        self.rarity = RarityType(rawValue: rarityValue) ?? .unknown
        self.imageAsset = dict["imageAsset"] as? String ?? ""
    }
}
