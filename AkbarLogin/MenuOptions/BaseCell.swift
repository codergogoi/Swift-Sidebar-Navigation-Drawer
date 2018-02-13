//
//  BaseCell.swift
//  AkbarLogin
//
//  Created by MAC01 on 13/02/18.
//  Copyright © 2018 Jayanta Gogoi. All rights reserved.
//

import UIKit

enum AppOptions{
    
    case EditProfile
    case ManageBookings
    case TravelUtility
    case OfferAndDiscounts
    case Travellers
    case ShareTheApp
    case Settings
    case Legal
    case ContactUs
    case LogOut
    case SignIn
    case SignUp
    case FBLogin
    case GPlusLogin
    case AkbarLogin
    
}

protocol MenuOptionsDelegate : class {
    
    func didTapOnMenuOption(optionsType: AppOptions)
}


 
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
