//
//  DrawerView.swift
//  AkbarLogin
//
//  Created by MAC01 on 12/02/18.
//  Copyright © 2018 Jayanta Gogoi. All rights reserved.
//

import UIKit

protocol DrawerDelegate: class{
    
    func overrideShowHideControl()
}


class DrawerView : UIView {
    
    weak var menuRootView: UIView!
    weak var controller: UIViewController!
    var damping: CGFloat = 0.7
    var velocity: CGFloat = 0.9
    var minSwipeValue : CGFloat = 0
    var maxSwipeValue : CGFloat = 0
    weak var HomeViewController: HomeViewController?

    override init(frame: CGRect) {
        super.init(frame: frame)
 
    }
    
    init(controller: UIViewController, rootView: HomeViewController? , frame: CGRect){
        super.init(frame: frame)
        self.minSwipeValue = 0 - UIScreen.main.bounds.size.width
        self.maxSwipeValue =  UIScreen.main.bounds.width - 120
        self.controller = controller
        self.HomeViewController = rootView!
        self.setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    func setupViews(){
 
        self.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        self.alpha  = 0.5

        let tapView = UIView(frame: CGRect(x: UIScreen.main.bounds.size.width-120, y: 0, width: 120, height: UIScreen.main.bounds.size.height))
        tapView.backgroundColor = UIColor.clear
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(swipePerform(_:)))
        self.addGestureRecognizer(panGesture)
        
        let layout = UICollectionViewFlowLayout()
        let menuVc = MenuViewController(collectionViewLayout: layout)
        menuVc.drawerDelegate = self
        if let controller = self.HomeViewController{
            menuVc.menuRootViewController = controller
        }
        let navController = UINavigationController(rootViewController: menuVc)
 
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissSideMenu))
        tapView.addGestureRecognizer(tapGesture)
        self.addSubview(tapView)
        
        if let rootView = navController.view{
            self.menuRootView = rootView
            self.addSubview(self.menuRootView)
            self.controller.addChildViewController(navController)
            //navController.didMove(toParentViewController: self.controller)
            
            self.menuRootView.layoutIfNeeded()
            self.menuRootView.frame = CGRect(x: 0 - UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width - 120, height: UIScreen.main.bounds.size.height)
            
            UIView.animate(withDuration: 0.7, delay: 0.0, usingSpringWithDamping: damping, initialSpringVelocity: velocity, options: .curveLinear, animations: {
                
                self.alpha = 1
                self.menuRootView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width-120, height: UIScreen.main.bounds.size.height);
                
            }, completion: nil)
        }
        
    }
    
    
    @objc func swipePerform(_ sender: UIPanGestureRecognizer){
        
        let velocity = sender.velocity(in: self)
        
        if sender.state == .changed {
            let translate = sender.translation(in: self)
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
                    self.menuWillShow(true)
                }else{ // left
                    self.menuWillShow(false)
                }
            }
            
        }else{
            sender.setTranslation(CGPoint(x: self.menuRootView.frame.origin.x, y:0), in: self)
            
        }
        
    }
    
    func menuWillShow(_ isShow: Bool){
        
        if isShow{
            UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: damping, initialSpringVelocity: velocity, options: .curveLinear, animations: {
                self.menuRootView.frame.origin = CGPoint(x: 0, y: self.menuRootView.frame.origin.y)
            }, completion: nil)
        }else{
            UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: damping, initialSpringVelocity: velocity, options: .curveLinear, animations: {
                self.menuRootView.frame.origin = CGPoint(x: self.minSwipeValue, y: self.menuRootView.frame.origin.y)
                self.alpha = 0
            }, completion: { (isDone) in
              self.removeFromSuperview()
            })
        }
        
        
    }
    
    @objc func dismissSideMenu(_ sender: UITapGestureRecognizer){
         self.menuWillShow(false)
     }
    
    
    
}

extension DrawerView : DrawerDelegate{
    
    func overrideShowHideControl() {
        self.menuWillShow(false)
    }
    
}

extension UIViewController {
 
    func showDrawer(viewController: HomeViewController?){
    
        if let window = UIApplication.shared.keyWindow{
            let sidebar = DrawerView(controller: window.rootViewController!, rootView: viewController, frame: UIScreen.main.bounds)
            if !window.subviews.contains(sidebar){
                window.addSubview(sidebar)
              }
        }
 
     }
     
}

