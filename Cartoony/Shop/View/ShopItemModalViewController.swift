//
//  ShopItemModalViewController.swift
//  Cartoony
//
//  Created by Nathan on 06/03/2020.
//  Copyright © 2020 Nathan. All rights reserved.
//

import UIKit

class ShopItemModalViewController: UIViewController {

    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet var shopItemView: UIView!
    
    var shopItem: ShopItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        guard let shopItem = shopItem else {
            return
        }

        priceLabel.text = "\(shopItem.price) coins"
        itemNameLabel.text = shopItem.itemName
        descriptionLabel.text = shopItem.description
        
        if let rarityColour = UIColor(named: shopItem.rarity) {
            shopItemView.backgroundColor = rarityColour
        }
        
        
    }

}
