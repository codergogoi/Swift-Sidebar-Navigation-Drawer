//
//  MenuViewController.swift
//  AkbarLogin
//
//  Created by MAC01 on 09/02/18.
//  Copyright © 2018 Jayanta Gogoi. All rights reserved.
//

import UIKit

class MenuViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    let menuCellIdentifier = "menuCell"
    let menuHeaderIdentifier = "menuHeader"
    
    var menuHeaderData = HeaderData(profilePic: nil, userName: "Jayanta Gogoi", isRegisteredUser: true)
 
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(MenuHeaderCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: menuHeaderIdentifier)
        collectionView?.register(MenuCell.self, forCellWithReuseIdentifier: menuCellIdentifier)
        collectionView?.showsVerticalScrollIndicator = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
  
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionElementKindSectionHeader{
            
            if let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: menuHeaderIdentifier, for: indexPath) as? MenuHeaderCell{
                
                header.delegate = self
                header.dataModel = self.menuHeaderData
                return header
            }
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: UIScreen.main.bounds.width - 120, height: ((self.view.frame.size.height/3) - 30))
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: menuCellIdentifier, for: indexPath) as! MenuCell
        cell.optionsIndex = indexPath.row
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: UIScreen.main.bounds.width - 120, height: self.view.frame.size.height/3)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        collectionView?.collectionViewLayout.invalidateLayout()
        
    }
    
}

extension MenuViewController: MenuHeaderDelegate {
    
    func didTapOnManageBooking() {
        
        print("Working...")
    }
    
    func didTapOnEditProfile() {
        
        print("working...")
    }
    
}




