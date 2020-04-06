//
//  ShowCell.swift
//  Cartoony
//
//  Created by Nathan on 18/03/2020.
//  Copyright © 2020 Nathan. All rights reserved.
//

import UIKit

class ShowTableCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    func setUpShowCell(show: Show) {
        nameLabel.text = show.name
    }
    
}
