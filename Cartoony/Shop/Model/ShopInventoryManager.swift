//
//  ShopInventoryManager.swift
//  Cartoony
//
//  Created by Nathan on 17/03/2020.
//  Copyright © 2020 Nathan. All rights reserved.
//

import Foundation

class ShopInventoryManager {
    
    fileprivate var shopItems:[ShopItem] = []
    
    func fetch() {
        for data in loadData() {
            shopItems.append(ShopItem(dict: data))
        }
    }
    
    func numberOfShopItems() -> Int {
        return shopItems.count
    }
    
    func shopItem(at indexPath: IndexPath) -> ShopItem {
        return shopItems[indexPath.item]
    }
    
    fileprivate func loadData() -> [[String: AnyObject]] {
        guard let path = Bundle.main.path(forResource: "ShopInventory", ofType: "plist"), let items = NSArray(contentsOfFile: path) else {
            return [[:]]
        }
        return items as! [[String: AnyObject]]
    }
}
