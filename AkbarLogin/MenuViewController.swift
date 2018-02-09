//
//  MenuViewController.swift
//  AkbarLogin
//
//  Created by MAC01 on 09/02/18.
//  Copyright © 2018 Jayanta Gogoi. All rights reserved.
//

import UIKit

class MenuViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    let cellIdentifier = "cellIdentifier"
    let menuHeaderIdentifier = "menuHeader"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(MenuHeaderCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: menuHeaderIdentifier)
        collectionView?.register(MenuCell.self, forCellWithReuseIdentifier: cellIdentifier)
        collectionView?.showsVerticalScrollIndicator = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
  
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionElementKindSectionHeader{
            
            if let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: menuHeaderIdentifier, for: indexPath) as? MenuHeaderCell{
                
                return header
            }
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: self.view.frame.size.width, height: 200)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! BaseCell
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.view.frame.size.width, height: 200)

    }
    
}

class MenuHeaderCell : BaseCell{
    
    
    
    let profilePic: UIImageView = {
       
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.layer.cornerRadius = 25
        imgView.layer.masksToBounds = true
        imgView.clipsToBounds = true
        imgView.contentMode = .scaleAspectFill
        imgView.backgroundColor = UIColor(red: 172/255, green: 19/255, blue: 24/255, alpha: 1)
        return imgView
        
    }()
    
    let lblUserName: UILabel = {
       
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.boldSystemFont(ofSize: 20)
        lbl.textColor = UIColor.darkGray
       
        lbl.text = "Hi Rahul Wadhani"
        return lbl
    }()
    
    let btnEditProfile: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        let paraStyle = NSMutableParagraphStyle()
        paraStyle.alignment = .left
        let attrText = NSMutableAttributedString(string: "EDIT PROFILE", attributes: [NSAttributedStringKey.foregroundColor: UIColor(red: 172/255, green: 19/255, blue: 24/255, alpha: 1), NSAttributedStringKey.font : UIFont.systemFont(ofSize: 18), NSAttributedStringKey.paragraphStyle: paraStyle])
        
        btn.setAttributedTitle(attrText, for: .normal)
        btn.contentHorizontalAlignment = .left
        btn.contentEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0)
        return btn
    }()
    
    let btnmanageBookings: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        let paraStyle = NSMutableParagraphStyle()
        paraStyle.alignment = .left
        let attrText = NSMutableAttributedString(string: "MANAGE BOOKINGS", attributes: [NSAttributedStringKey.foregroundColor: UIColor(red: 172/255, green: 19/255, blue: 24/255, alpha: 1), NSAttributedStringKey.font : UIFont.systemFont(ofSize: 18), NSAttributedStringKey.paragraphStyle: paraStyle])
        
        btn.setAttributedTitle(attrText, for: .normal)
        btn.contentHorizontalAlignment = .left
        btn.contentEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0)

        return btn
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(profilePic)
        addSubview(lblUserName)
        addSubview(btnEditProfile)
        addSubview(btnmanageBookings)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0(50)]-[v1]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": profilePic, "v1": lblUserName]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-30-[v0(50)]-15-[v1(40)]-10-[v2(40)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": profilePic,"v1": btnEditProfile, "v2": btnmanageBookings]))
        
         addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(40)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": lblUserName]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": btnEditProfile]))
        
         addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": btnmanageBookings]))
 
        
        addConstraint(NSLayoutConstraint(item: self.lblUserName, attribute: .centerY, relatedBy: .equal, toItem: self.profilePic, attribute: .centerY, multiplier: 1, constant: 0))
        
        
     }
    
}




class MenuCell: BaseCell {
    
    override func setupViews() {
        super.setupViews()
        self.backgroundColor = UIColor.lightGray
        
    }
}


class BaseCell : UICollectionViewCell {
    
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


