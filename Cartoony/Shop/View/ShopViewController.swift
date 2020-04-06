//
//  ShopViewController.swift
//  Cartoony
//
//  Created by Nathan on 03/03/2020.
//  Copyright © 2020 Nathan. All rights reserved.
//

import UIKit

class ShopViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var selectedShopItem: ShopItem?
    
    let shopInventoryManager = ShopInventoryManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shopInventoryManager.fetch()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shopInventoryManager.numberOfShopItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "shopItemCell") as? ShopItemCell else {
            return UITableViewCell()
        }
        
        let shopItem = shopInventoryManager.shopItem(at: indexPath)
        
        cell.setUpShopItemCell(title: shopItem.itemName, rarity: shopItem.rarity, price: shopItem.price)
        
        if let rarityColour = UIColor(named: shopItem.rarity) {
            cell.backgroundColor = rarityColour
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        selectedShopItem = shopInventoryManager.shopItem(at: indexPath)
        
        performSegue(withIdentifier: "openShopItemModalView", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "openShopItemModalView" {
            if let navVc = segue.destination as? UINavigationController, let vc = navVc.viewControllers.first as? ShopItemModalViewController, let shopItem = selectedShopItem {
                vc.shopItem = shopItem
            }
        }
    }

    @IBAction func unwindLocationCancel(segue: UIStoryboardSegue) {
        
    }
    
}
