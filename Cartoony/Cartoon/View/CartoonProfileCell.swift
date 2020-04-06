//
//  CartoonProfileCell.swift
//  Cartoony
//
//  Created by Nathan on 04/03/2020.
//  Copyright © 2020 Nathan. All rights reserved.
//

import UIKit

class CartoonProfileCell: UICollectionViewCell {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    func setUpCartoonProfileCell(cartoon: Cartoon) {
        nameLabel.text = cartoon.name
        
        if !cartoon.imageAsset.isEmpty {
            profileImage.image = UIImage(named: cartoon.imageAsset)
        } else {
            profileImage.image = UIImage(named: "Character_Sillouette")
        }
    
        self.backgroundColor = UIColor(named: cartoon.rarity.rawValue)
        self.layer.cornerRadius = 10
    }
    
    
}
