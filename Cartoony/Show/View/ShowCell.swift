//
//  ShowCell.swift
//  Cartoony
//
//  Created by Nathan on 18/03/2020.
//  Copyright © 2020 Nathan. All rights reserved.
//

import UIKit

class ShowCell: UITableViewCell {
    
    //outlet
    @IBOutlet weak var nameLabel: UILabel!
    
    
    //setup
    func setUpShowCell(name: String) {
        nameLabel.text = name
    }
    
}
