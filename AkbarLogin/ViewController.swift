//
//  ViewController.swift
//  AkbarLogin
//
//  Created by MAC01 on 09/02/18.
//  Copyright © 2018 Jayanta Gogoi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var appMenuView : UIView?
    var menuRootView = UIView()
    
    var minSwipeValue : CGFloat = 0
    var maxSwipeValue : CGFloat = 0
    var damping: CGFloat = 0.7
    var velocity: CGFloat = 0.9
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.minSwipeValue = 0 - UIScreen.main.bounds.size.width
        self.maxSwipeValue =  UIScreen.main.bounds.width - 120
     
        self.appMenuView = UIView(frame: UIScreen.main.bounds)
        self.appMenuView?.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        self.appMenuView?.alpha = 0
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - onTap Action
    
    @IBAction func onTapMenuOptions(_ sender: UIButton){
        
        self.view.addSubview(self.appMenuView!)
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(swipePerform(_:)))
        self.appMenuView?.addGestureRecognizer(panGesture)
        let layout = UICollectionViewFlowLayout()
        let menuVc = MenuViewController(collectionViewLayout: layout)

        let navController = UINavigationController(rootViewController: menuVc)
        
        if let rootView = navController.view{
            self.menuRootView = rootView
            self.appMenuView?.addSubview(self.menuRootView)
            self.addChildViewController(navController)
            
            self.menuRootView.layoutIfNeeded()
            self.menuRootView.frame = CGRect(x: 0 - UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width - 120, height: UIScreen.main.bounds.size.height)
            
            UIView.animate(withDuration: 0.7, delay: 0.0, usingSpringWithDamping: damping, initialSpringVelocity: velocity, options: .curveLinear, animations: {
                self.appMenuView?.alpha = 1
                self.menuRootView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width-120, height: UIScreen.main.bounds.size.height);
                
             }, completion: nil)
        }
        
       
 

    }
  
    
    @objc func swipePerform(_ sender: UIPanGestureRecognizer){
        
        let velocity = sender.velocity(in: self.appMenuView)
        
        if sender.state == .changed {
            let translate = sender.translation(in: self.appMenuView)
            UIView.animate(withDuration: 0.5) {
                DispatchQueue.main.async {
                    let xPos = translate.x
 
                    if xPos > self.minSwipeValue && xPos < 0{
                         self.menuRootView.frame.origin = CGPoint(x: translate.x, y: self.menuRootView.frame.origin.y)
 
                    }
                }
            }
            
        }else if sender.state == .ended{
            
            DispatchQueue.main.async {
                
                if velocity.x > 0 { // right
                    self.meniWillShow(true)
                }else{ // left
                     self.meniWillShow(false)
                }
            }
 
        }else{
           sender.setTranslation(CGPoint(x: self.menuRootView.frame.origin.x, y:0), in: self.appMenuView)
            
        }
        
    }
    
 
    func meniWillShow(_ isShow: Bool){
        
        if isShow{
            UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: damping, initialSpringVelocity: velocity, options: .curveLinear, animations: {
                self.menuRootView.frame.origin = CGPoint(x: 0, y: self.menuRootView.frame.origin.y)
            }, completion: nil)
        }else{
            UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: damping, initialSpringVelocity: velocity, options: .curveLinear, animations: {
                self.menuRootView.frame.origin = CGPoint(x: self.minSwipeValue, y: self.menuRootView.frame.origin.y)
                self.appMenuView?.alpha = 0
            }, completion: { (isDone) in
                
                self.appMenuView?.removeFromSuperview()
            })
        }
     }

}


