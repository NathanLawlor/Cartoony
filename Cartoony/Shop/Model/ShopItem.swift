//
//  ShopItem.swift
//  Cartoony
//
//  Created by Nathan on 17/03/2020.
//  Copyright © 2020 Nathan. All rights reserved.
//

import Foundation

struct ShopItem {
    var itemName: String
    var price: Int
    var rarity: String
    var description: String
}

extension ShopItem {
    init(dict:[String:AnyObject]) {
        self.itemName = dict["itemName"] as! String
        self.price = dict["price"] as! Int
        self.rarity = dict["rarity"] as! String
        self.description = dict["description"] as! String
    }
}
