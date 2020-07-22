//
//  GSBaseViewController.swift
//  GoalScore
//
//  Created by mac_user on 6/27/20.
//  Copyright © 2020 com.TGL.GoalScore. All rights reserved.
//

import UIKit

class GSBaseViewController: UIViewController, GSHeaderViewDelegate {
    
    @IBOutlet var leadingC: NSLayoutConstraint?
    @IBOutlet var menuWidthConstraint: NSLayoutConstraint?
    @IBOutlet var menuViewWidthConstraint: NSLayoutConstraint?
    @IBOutlet var menucontainer: UIView?
    @IBOutlet var menuView: UIView?
    @IBOutlet var hiddenMenu: UIView?
    @IBOutlet weak var headerViewHeightConstraint: NSLayoutConstraint?
    
    var sideMenuIsVisible = false
    var sideMenuView: SideMenuView? = UIView.fromNib()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        //change color for tab bar item on select and deselect
        self.tabBarController?.tabBar.barTintColor =  UIColor(hexString: "#2B2A48")
        self.tabBarController?.tabBar.tintColor = UIColor(hexString: "#fde291") //on select
        
        self.setupHeaderView()
        self.setupInterface()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let sideMenuView = self.sideMenuView {
            sideMenuView.menuDidLoad()
            self.closeSideMenu()
            self.menuView?.addSubview(sideMenuView)
            self.sideMenuView?.dock(parentView: self.menuView)
        }
    }
    
    func setupHeaderView() {
        self.headerViewHeightConstraint?.constant += UIApplication.shared.statusBarFrame.height
    }
    
    func setupInterface() {
        
        if(!sideMenuIsVisible) {
            menucontainer?.isHidden = true
            menuWidthConstraint?.constant = 0
            menuViewWidthConstraint?.constant = 0
            sideMenuIsVisible = false
        }
        
        sideMenuView?.homeParentViewController = self
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(menuTap))
        tap.numberOfTapsRequired = 1
        hiddenMenu?.addGestureRecognizer(tap)
    }
    
    @objc func menuTap() {
        self.showSideMenu()
    }
    
    func closeSideMenu() {
        menucontainer?.isHidden = true
        menuWidthConstraint?.constant = 0
        menuViewWidthConstraint?.constant = 0
        sideMenuIsVisible = false
    }
    
    func showSideMenu() {
        if !sideMenuIsVisible {
            menucontainer?.isHidden = false
            menuWidthConstraint?.constant = UIScreen.main.bounds.width
            menuViewWidthConstraint?.constant = UIScreen.main.bounds.width * 0.6
            sideMenuIsVisible = true
        } else {
            menucontainer?.isHidden = true
            menuWidthConstraint?.constant = 0
            menuViewWidthConstraint?.constant = 0
            sideMenuIsVisible = false
        }
        
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .transitionFlipFromTop, animations: {
            self.view.layoutIfNeeded()
        }) { (animationComplete) in
            print("The animation is complete!")
        }
    }
    
    func onLeftButtonTap() {
        self.showSideMenu()
    }
    
}
