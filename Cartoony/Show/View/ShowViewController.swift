//
//  ShowsViewController.swift
//  Cartoony
//
//  Created by Nathan on 18/03/2020.
//  Copyright © 2020 Nathan. All rights reserved.
//

import UIKit

class ShowViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let showManager = ShowManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showManager.fetch()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "openShowCartoonCollection" {
            if let vc = segue.destination as? ShowCartoonsViewController, let selectedShow = sender as? Show {
                vc.show = selectedShow
            }
        }
    }
}

extension ShowViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return showManager.numberOfShows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "showTableCell") as? ShowTableCell else {
            return UITableViewCell()
        }
        
        let show = showManager.show(at: indexPath)
        cell.setUpShowCell(show: show)
        
        return cell
    }
}

extension ShowViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let selectedShow = showManager.show(at: indexPath)
        performSegue(withIdentifier: "openShowCartoonCollection", sender: selectedShow)
    }
}
