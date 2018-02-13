//
//  MenuCell.swift
//  AkbarLogin
//
//  Created by MAC01 on 09/02/18.
//  Copyright © 2018 Jayanta Gogoi. All rights reserved.
//

import UIKit


class MenuCell: BaseCell {
    
    var delegate: MenuOptionsDelegate?
    
    let optionsWithIcons = "iconOptions"
    let options = "options"
    
    let utilityOptions = [("Travel Utility",AppOptions.TravelUtility),("Offers & Discounts",AppOptions.OfferAndDiscounts), ("Travellers",AppOptions.Travellers),("Share the App",AppOptions.ShareTheApp)] as [Any]
    
    let settingsOptions = [("Settings", #imageLiteral(resourceName: "mnu_settings"),AppOptions.Settings) ,("Legal", #imageLiteral(resourceName: "mnu_legal"),AppOptions.Legal),("Contact Us", #imageLiteral(resourceName: "mnu_contact"),AppOptions.ContactUs),("Log Out", #imageLiteral(resourceName: "mnu_logout"),AppOptions.LogOut)] as [Any]
    
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
            
            if let dataModel = self.settingsOptions[indexPath.row] as? (String, UIImage, AppOptions) {
                
                cell.dataModel = dataModel
            }
 
            return cell
        }else{
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: options, for: indexPath) as! MenuOptions
            
            if let dataModel = self.utilityOptions[indexPath.row] as? (String, AppOptions) {
                
                cell.dataModel = dataModel
            }
 
            return cell
        }
        
      
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if optionsIndex > 0{
           
            if let dataModel = self.settingsOptions[indexPath.row] as? (String, UIImage, AppOptions) {
                self.delegate?.didTapOnMenuOption(optionsType: dataModel.2)
            }
          }else{
            
             if let dataModel = self.utilityOptions[indexPath.row] as? (String, AppOptions) {
                self.delegate?.didTapOnMenuOption(optionsType: dataModel.1)
             }
            
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
    
    var dataModel: (name: String, options: AppOptions)? {
        
        didSet{
            if let dataModel = dataModel{
                lblOptions.text = dataModel.name
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
    
    let arrowImg: UIImageView  = {
        
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        imgView.image = #imageLiteral(resourceName: "arrow_icon")
        
        return imgView
    }()
    
    var dataModel : (name: String, img: UIImage, options: AppOptions)?{
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
        addSubview(arrowImg)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[v0(20)]-[v1]-[v3(15)]-40-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":imgIcon,"v1": lblOptions, "v3": arrowImg]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(15)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":arrowImg]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(20)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":imgIcon]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[v0]-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":lblOptions]))
        
        addConstraint(NSLayoutConstraint(item: imgIcon, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: arrowImg, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        
        
    }
}

