//
//  ViewController.swift
//  AkbarLogin
//
//  Created by MAC01 on 09/02/18.
//  Copyright © 2018 Jayanta Gogoi. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
 
 
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Drawer Side Navigation"
        let menuButton = UIBarButtonItem(image: #imageLiteral(resourceName: "menu"), style: .plain, target: self, action: #selector(onTapMenuOptions(_:)))
        menuButton.tintColor = UIColor.white
        navigationItem.leftBarButtonItems = [menuButton]
        self.view.backgroundColor = UIColor.white
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - onTap Action
    @objc func onTapMenuOptions(_ sender: UIButton){
    
         self.showDrawer(viewController: self)
    } 
    
    func performMenuOptionsOnTapActions(optionsType: AppOptions){
        
        switch optionsType {
            
        case .EditProfile:
            let editProfile = EditProfileViewController()
            self.navigationController?.pushViewController(editProfile, animated: true)
        case .ManageBookings:
            let manageBookings = ManageBookingsViewController()
            self.navigationController?.pushViewController(manageBookings, animated: true)
        default:
            //Default controller -> check for Login
            print("do nothing")
        }
        
        
    }

}


