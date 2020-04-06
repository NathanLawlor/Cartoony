//
//  ShowCartoonsViewController.swift
//  Cartoony
//
//  Created by Nathan on 06/04/2020.
//  Copyright © 2020 Nathan. All rights reserved.
//

import UIKit

class ShowCartoonsViewController: UIViewController {
    
    @IBOutlet weak var showNameLabel: UILabel!
    
    var show: Show?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let show = show else {
            return
        }
        
        showNameLabel.text = show.name
    }
}
