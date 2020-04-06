//
//  ShopItemCell.swift
//  Cartoony
//
//  Created by Nathan on 03/03/2020.
//  Copyright © 2020 Nathan. All rights reserved.
//

import UIKit

class ShopItemCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var rarityLabel: UILabel!
    
    func setUpShopItemCell(shopItem: ShopItem) {
        titleLabel.text = shopItem.itemName
        rarityLabel.text = shopItem.rarity.rawValue
        priceLabel.text = "\(shopItem.price) coins"
        
        self.backgroundColor = UIColor(named: shopItem.rarity.rawValue)
    }
    
}
