//
//  EditProfileViewController.swift
//  AkbarLogin
//
//  Created by MAC01 on 13/02/18.
//  Copyright © 2018 Jayanta Gogoi. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
         navigationItem.title = "Edit Profile"
        self.view.backgroundColor = UIColor.white
      
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.navigationController?.popViewController(animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   

}
