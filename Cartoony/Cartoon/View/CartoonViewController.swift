//
//  CartoonViewController.swift
//  Cartoony
//
//  Created by Nathan on 03/03/2020.
//  Copyright © 2020 Nathan. All rights reserved.
//

import UIKit

class CartoonViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    //MARK: Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var commonRarityButton: UIRarityButton! {
        didSet {
            commonRarityButton.rarity = .common
        }
    }
    @IBOutlet weak var rareRarityButton: UIRarityButton! {
        didSet {
            rareRarityButton.rarity = .rare
        }
    }
    @IBOutlet weak var epicRarityButton: UIRarityButton! {
        didSet {
            epicRarityButton.rarity = .epic
        }
    }
    @IBOutlet weak var allRarityButton: UIRarityButton! {
        didSet {
            allRarityButton.rarity = .unknown
        }
    }
    
    //MARK: Properties
    let cartoonManager = CartoonManager()
    var selectedCartoon: Cartoon?
    var selectedRarity: RarityType = .unknown
    
    //MARK: Data
    override func viewDidLoad() {
        super.viewDidLoad()
        cartoonManager.fetch()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cartoonManager.numberOfCartoons()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cartoonProfileCell", for: indexPath) as? CartoonProfileCell else {
            return UICollectionViewCell()
        }
        
        let cartoon = cartoonManager.cartoon(at: indexPath)
        cell.setUpCartoonProfileCell(cartoon: cartoon)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)

        selectedCartoon = cartoonManager.cartoon(at: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "openCartoonProfileView" {
            if let vc = segue.destination as? CartoonProfileViewController, let cartoon = selectedCartoon {
                vc.cartoon = cartoon
            }
        }
    }
    
}

extension CartoonViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        cartoonManager.filter(bySearch: searchText, selectedRarity: selectedRarity)
        reloadCollectionWithAnimation()
    }
    
    func clearSearch() {
        searchBar.text = ""
    }
    
}

extension CartoonViewController {
    
    @IBAction func filterByRarity(_ sender: Any) {
        guard let rarityButton = sender as? UIRarityButton, let rarity = rarityButton.rarity else {
            return
        }
        
        cartoonManager.filter(byRarity: rarity)
        selectedRarity = rarity
        clearSearch()
        reloadCollectionWithAnimation()
    }
    
    fileprivate func reloadCollectionWithAnimation() {
        collectionView.performBatchUpdates({
            collectionView.reloadSections([0])
        }, completion: nil)
    }
    
}





    //not currently used
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath)
//        return headerView
//    }
