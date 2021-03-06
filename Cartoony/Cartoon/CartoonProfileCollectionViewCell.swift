//
//  CartoonProfileCollectionViewCell.swift
//  Cartoony
//
//  Created by Nathan on 04/03/2020.
//  Copyright © 2020 Nathan. All rights reserved.
//

import UIKit

protocol CartoonProfileCollectionViewCellDelegate {
    func segueToCartoonView()
}

class CartoonProfileCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var delegate: CartoonProfileCollectionViewCellDelegate?
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setUp(cartoon: Cartoon, delegate: CartoonProfileCollectionViewCellDelegate ) {
        self.delegate = delegate
        
        nameLabel.text = cartoon.name
        
        if !cartoon.imageAsset.isEmpty {
            profileImage.image = UIImage(named: cartoon.imageAsset)
        } else {
            profileImage.image = UIImage(named: "Character_Sillouette")
        }
    
        self.backgroundColor = UIColor(named: cartoon.rarity.rawValue)
        self.layer.cornerRadius = 10
    }

    @IBAction func statsButtonPressed(_ sender: Any) {
        delegate?.segueToCartoonView()
    }
    
    @IBAction func infoButtonPressed(_ sender: Any) {
        delegate?.segueToCartoonView()
    }
    
}
