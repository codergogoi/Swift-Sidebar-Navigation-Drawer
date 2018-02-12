//
//  MenuCell.swift
//  AkbarLogin
//
//  Created by MAC01 on 09/02/18.
//  Copyright © 2018 Jayanta Gogoi. All rights reserved.
//

import UIKit


class BaseCell : UICollectionViewCell {
    
    let imgIcon: UIImageView = {
        
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.layer.masksToBounds = true
        imgView.clipsToBounds = true
        imgView.contentMode = .scaleAspectFill
        imgView.backgroundColor = UIColor(red: 172/255, green: 19/255, blue: 24/255, alpha: 1)
        return imgView
        
    }()
    
    let lblOptions: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.appFont(fSize: 18)
        lbl.textColor = UIColor.darkGray
        return lbl
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupViews(){
        
    }
}


class MenuCell: BaseCell {
    
    let optionsWithIcons = "iconOptions"
    let options = "options"
    
    let utilityOptions = ["Travel Utility","Offers & Discounts", "Travellers","Share the App"]
    
    let settingsOptions = [("Settings", #imageLiteral(resourceName: "mnu_settings")) ,("Legal", #imageLiteral(resourceName: "mnu_legal")),("Contact Us", #imageLiteral(resourceName: "mnu_contact")),("Log Out", #imageLiteral(resourceName: "mnu_logout"))] as [Any]
    
    var optionsIndex = 0
    
    let viewLine : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.lightGray
        return view
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collView.translatesAutoresizingMaskIntoConstraints = false
        collView.backgroundColor = UIColor.white
        return collView
    }()
    
    override func setupViews() {
        super.setupViews()
        addSubview(viewLine)
        addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(MenuOptions.self, forCellWithReuseIdentifier: options)
        collectionView.register(MenuOptionsWithIcons.self, forCellWithReuseIdentifier: optionsWithIcons)
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": collectionView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[v0]-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": collectionView]))

        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": viewLine]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-2-[v0(1)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": viewLine]))
        
    }
    
}

extension MenuCell : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if optionsIndex > 0{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: optionsWithIcons, for: indexPath) as! MenuOptionsWithIcons
            
            if let dataModel = self.settingsOptions[indexPath.row] as? (String, UIImage) {
                
                cell.dataModel = dataModel
            }
 
            return cell
        }else{
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: options, for: indexPath) as! MenuOptions
            
            cell.dataModel = self.utilityOptions[indexPath.row]
            
            return cell
        }
        
      
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.frame.size.width, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
    }
    
}

class MenuOptions: BaseCell{
    
    var dataModel: String? {
        
        didSet{
            if let dataModel = dataModel{
                lblOptions.text = dataModel
            }
        }
        
    }
    
    override func setupViews() {
        super.setupViews()
         addSubview(lblOptions)
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[v0]-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":lblOptions]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-5-[v0]-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":lblOptions]))
        
    }
}


class MenuOptionsWithIcons: BaseCell{
    
    var dataModel : (name: String, img: UIImage)?{
        didSet{
            if let dataModel = dataModel{
                imgIcon.image = dataModel.img
                lblOptions.text = dataModel.name
            }
        }
    }
    
    override func setupViews() {
        super.setupViews()
         addSubview(imgIcon)
        addSubview(lblOptions)
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[v0(20)]-[v1]-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":imgIcon,"v1": lblOptions]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[v0(20)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":imgIcon]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[v0]-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":lblOptions]))

    }
}

