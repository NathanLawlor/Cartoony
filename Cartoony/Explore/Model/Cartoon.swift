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
    var showKey: String
    var imageAsset: String
    var about: String
}

extension Cartoon {
    init(dict:[String:AnyObject]) {
        self.name = dict["name"] as? String ?? ""
        let rarityValue = dict["rarity"] as? String ?? ""
        self.rarity = RarityType(rawValue: rarityValue) ?? .unknown
        self.showKey = dict["showKey"] as? String ?? ""
        self.imageAsset = dict["imageAsset"] as? String ?? ""
        self.about = dict["about"] as? String ?? "Default About Text"
    }
}
