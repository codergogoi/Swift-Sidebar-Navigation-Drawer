//
//  MenuHeaderCell.swift
//  AkbarLogin
//
//  Created by MAC01 on 12/02/18.
//  Copyright © 2018 Jayanta Gogoi. All rights reserved.
//

import UIKit

struct HeaderData {
    
    var profilePic: String?
    var userName: String?
    var isRegisteredUser = false
 
}



class MenuHeaderCell : BaseCell {
  
    var delegate: MenuOptionsDelegate?
    
    var dataModel: HeaderData? {
        
        didSet{
            if let dataModel = dataModel{
                
                if let userName = dataModel.userName{
                    lblUserName.text = "Hi \(userName)"
                }
                if let profileImage = dataModel.profilePic{
                    //set user Image
                    profilePic.image = #imageLiteral(resourceName: "user_icon")
                    print("\(profileImage)")
                }else{
                    profilePic.image = #imageLiteral(resourceName: "user_icon")
                }
                
            }
        }
        
    }
    
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
        lbl.font = UIFont.appFont(fSize: 20)
        lbl.textColor = UIColor.darkGray
        return lbl
    }()
    
    let btnEditProfile: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        let paraStyle = NSMutableParagraphStyle()
        paraStyle.alignment = .left
        let attrText = NSMutableAttributedString(string: "EDIT PROFILE", attributes: [NSAttributedStringKey.foregroundColor: UIColor(red: 172/255, green: 19/255, blue: 24/255, alpha: 1), NSAttributedStringKey.font : UIFont.appFont(fSize: 18), NSAttributedStringKey.paragraphStyle: paraStyle])
        
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
        let attrText = NSMutableAttributedString(string: "MANAGE BOOKINGS", attributes: [NSAttributedStringKey.foregroundColor: UIColor(red: 172/255, green: 19/255, blue: 24/255, alpha: 1), NSAttributedStringKey.font :  UIFont.appFont(fSize: 18), NSAttributedStringKey.paragraphStyle: paraStyle])
        
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
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-30-[v0(50)]-30-[v1(30)]-10-[v2(30)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": profilePic,"v1": btnEditProfile, "v2": btnmanageBookings]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(40)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": lblUserName]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": btnEditProfile]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": btnmanageBookings]))
        
        
        addConstraint(NSLayoutConstraint(item: self.lblUserName, attribute: .centerY, relatedBy: .equal, toItem: self.profilePic, attribute: .centerY, multiplier: 1, constant: 0))
        
        btnEditProfile.addTarget(self, action: #selector(onTapEditProfile), for: .touchUpInside)
        btnmanageBookings.addTarget(self, action: #selector(onTapManageBookings), for: .touchUpInside)
    }
    
    //perform On Tap actions
    @objc func onTapEditProfile(){
        let editProfile = AppOptions.EditProfile
        self.delegate?.didTapOnMenuOption(optionsType: editProfile)
    }
    
    @objc func onTapManageBookings(){
        let manageBookings = AppOptions.ManageBookings
        self.delegate?.didTapOnMenuOption(optionsType: manageBookings)

    }
    
}
