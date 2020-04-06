//
//  Show.swift
//  Cartoony
//
//  Created by Nathan on 18/03/2020.
//  Copyright © 2020 Nathan. All rights reserved.
//

import Foundation

struct Show {
    var name: String
    var key: String
}

extension Show {
    init(dict:[String:AnyObject]) {
        self.name = dict["name"] as? String ?? ""
        self.key = dict["key"] as? String ?? ""
    }
}
