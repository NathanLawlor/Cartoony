//
//  ShowCartoonsViewController.swift
//  Cartoony
//
//  Created by Nathan on 06/04/2020.
//  Copyright © 2020 Nathan. All rights reserved.
//

import UIKit

class ShowCartoonsViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.register(UINib(nibName: "CartoonProfileCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CartoonProfileCollectionViewCell")
        }
    }
    @IBOutlet weak var showNameLabel: UILabel!
    
    let cartoonManager = CartoonManager()
    var selectedCartoon: Cartoon?
    var show: Show?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cartoonManager.fetch()
        
        setupView()
    }
    
    func setupView() {
        guard let show = show else {
            return
        }
        
        showNameLabel.text = show.name
        
        cartoonManager.fetchCartoons(byShowKey: show.key)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "openCartoonProfileView" {
            if let vc = segue.destination as? CartoonProfileViewController, let cartoon = selectedCartoon {
                vc.cartoon = cartoon
            }
        }
    }
}

extension ShowCartoonsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cartoonManager.numberOfCartoons()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CartoonProfileCollectionViewCell", for: indexPath) as? CartoonProfileCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let cartoon = cartoonManager.cartoon(at: indexPath)
        cell.setUp(cartoon: cartoon, delegate: self)
        
        return cell
    }
}

extension ShowCartoonsViewController: UICollectionViewDelegate {
 
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        selectedCartoon = cartoonManager.cartoon(at: indexPath)
    }
}

extension ShowCartoonsViewController: CartoonProfileCollectionViewCellDelegate {
    
    func segueToCartoonView() {
        performSegue(withIdentifier: "openCartoonProfileView", sender: nil)
    }
    
}
