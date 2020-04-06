//
//  CartoonManager.swift
//  Cartoony
//
//  Created by Nathan on 18/03/2020.
//  Copyright © 2020 Nathan. All rights reserved.
//

import Foundation

class CartoonManager {
    
    fileprivate var cartoonsCopy: [Cartoon] = []
    fileprivate var cartoons: [Cartoon] = []
    
    func fetch() {
        for data in loadData() {
            cartoons.append(Cartoon(dict: data))
        }
        sortCartoonsAlphabetically()
        cartoonsCopy = cartoons
    }
    
    func numberOfCartoons() -> Int {
        return cartoons.count
    }
    
    func cartoon(at indexPath: IndexPath) -> Cartoon {
        return cartoons[indexPath.item]
    }
    
    func fetchCartoons(byShowKey key: String) {
        cartoons = cartoonsCopy.filter { $0.showKey == key}
    }
    
    func numberOfCartoons(inShow showKey: String) -> Int {
        return cartoonsCopy.filter { $0.showKey == showKey }.count
    }
    
    fileprivate func loadData() -> [[String: AnyObject]] {
        guard let path = Bundle.main.path(forResource: "Cartoons", ofType: "plist"), let items = NSArray(contentsOfFile: path) else {
            return [[:]]
        }
        return items as! [[String: AnyObject]]
    }
    
    func filter(byRarity rarity: RarityType) {
        if rarity != .unknown {
            cartoons = cartoonsCopy.filter { $0.rarity == rarity }
        } else {
            cartoons = cartoonsCopy
        }
        sortCartoonsAlphabetically()
    }
    
    func filter(bySearch searchText: String, selectedRarity: RarityType) {
        filter(byRarity: selectedRarity)
        if !searchText.isEmpty {
            cartoons = cartoons.filter { $0.name.lowercased().range(of: searchText.lowercased()) != nil }
        }
    }
    
    fileprivate func sortCartoonsAlphabetically() {
        cartoons = cartoons.sorted { $0.name.lowercased() < $1.name.lowercased() }
    }
    
}
