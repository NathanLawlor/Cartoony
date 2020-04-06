//
//  ShowManager.swift
//  Cartoony
//
//  Created by Nathan on 18/03/2020.
//  Copyright © 2020 Nathan. All rights reserved.
//

import Foundation

class ShowManager {
    
    fileprivate var shows: [Show] = []
    
    func fetch() {
        var unsortedShows: [Show] = []
        for data in loadData() {
            unsortedShows.append(Show(dict: data))
        }
        shows = unsortedShows.sorted { $0.name.lowercased() < $1.name.lowercased() }
    }
    
    func numberOfShows() -> Int {
        return shows.count
    }
    
    func show(at indexPath: IndexPath) -> Show {
        return shows[indexPath.item]
    }
    
    fileprivate func loadData() -> [[String: AnyObject]] {
        guard let path = Bundle.main.path(forResource: "Shows", ofType: "plist"), let items = NSArray(contentsOfFile: path) else {
            return [[:]]
        }
        return items as! [[String: AnyObject]]
    }
    
}
