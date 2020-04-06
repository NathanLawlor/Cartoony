//
//  ShowsViewController.swift
//  Cartoony
//
//  Created by Nathan on 18/03/2020.
//  Copyright © 2020 Nathan. All rights reserved.
//

import UIKit

class ShowsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let showManager = ShowManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showManager.fetch()
    }
}

extension ShowsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return showManager.numberOfShows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "showCell") as? ShowCell else {
            return UITableViewCell()
        }
        
        let show = showManager.show(at: indexPath)
        
        cell.setUpShowCell(name: show.name)
        
        return cell
    }
}

extension ShowsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
