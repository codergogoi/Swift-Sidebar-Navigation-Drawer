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
        self.showDrawer()
        
    }
  
   

}


