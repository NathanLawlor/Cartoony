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
    
    func setUpShopItemCell(title: String, rarity: String, price: Int) {
        titleLabel.text = title
        rarityLabel.text = rarity
        priceLabel.text = "\(price) coins"
    }
    
}
