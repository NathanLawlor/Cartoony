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
        cell.setUpCartoonProfileCell(cartoon: cartoon)
        
        return cell
    }
}

extension ShowCartoonsViewController: UICollectionViewDelegate {
    
}
