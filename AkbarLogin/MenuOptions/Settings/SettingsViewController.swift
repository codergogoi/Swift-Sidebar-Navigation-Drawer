//
//  SettingsViewController.swift
//  AkbarLogin
//
//  Created by MAC01 on 13/02/18.
//  Copyright © 2018 Jayanta Gogoi. All rights reserved.
//

import UIKit


class SettingsViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    
    let cellIdentifier = "settings"
    let headreIdentifier = "header"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(SettingsCell.self, forCellWithReuseIdentifier: cellIdentifier)
        collectionView?.register(SettingsHeader.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headreIdentifier)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.navigationController?.popViewController(animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionElementKindSectionHeader {
            
            if let header  = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headreIdentifier, for: indexPath) as? SettingsHeader{
                header.settingsViewController = self
                return header
            }
        }
        
        return UICollectionViewCell()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: self.view.frame.size.width, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.view.frame.size.width, height: 60)
    }
    

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! SettingsCell
    
        return cell
    }
    
    func onTapBackButton(){
        DispatchQueue.main.async {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
 
}


class SettingsHeader : BaseCell {
    
    weak var settingsViewController : SettingsViewController?
    
    let backButton: UIButton = {
        let btn = UIButton()
         btn.setBackgroundImage(#imageLiteral(resourceName: "flip_arrow"), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        return btn
    }()
    
    let settingsIcon : UIImageView = {
       
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        return img
    }()
    
    
    override func setupViews() {
        super.setupViews()
        self.addSubview(backButton)
        self.addSubview(settingsIcon)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0(100)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": backButton]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-30-[v0(40)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": backButton]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v0(30)]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": backButton]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-30-[v0(30)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": backButton]))
        self.backButton.addTarget(self, action: #selector(onTapBackButton), for: .touchUpInside)
    }
    
    @objc func onTapBackButton(){
        self.settingsViewController?.onTapBackButton()
    }
}

class SettingsCell: BaseCell{
    
    
    override func setupViews() {
        super.setupViews()
        self.backgroundColor = UIColor.blue
    }
    
}










