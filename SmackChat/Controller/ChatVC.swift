//
//  ChatVC.swift
//  SmackChat
//
//  Created by Hammoud Hammoud on 12/4/17.
//  Copyright © 2017 Hammoud Hammoud. All rights reserved.
//

import UIKit
import SideMenu
import PinLayout

class ChatVC: UIViewController {

    //MARK: - Properties
    let topMenuBar: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.2901960784, green: 0.3019607843, blue: 0.8470588235, alpha: 1)
        return view
    }()
    
    let smackChatLabel: UILabel = {
        let label = UILabel()
        label.text = "Smack Chat"
//        label.font = UIFont(name: "Avenir", size: 24.0)
        label.textColor = .white
        return label
    }()
    
    let sideMenuButton: UIButton = {
        let button = UIButton()
        button.setTitle("", for: .normal)
        button.setImage(UIImage(named: "smackBurger"), for: .normal)
        button.addTarget(self, action: #selector(openSideMenu), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Running")
        self.view.backgroundColor = .white
        setupMenuBar()
        setupSideMenu()
    }
    
    override func viewDidLayoutSubviews() {
        //Menubar layout
        topMenuBar.pin.top().left().right().height(60)
        sideMenuButton.pin.width(24).height(20).bottomLeft().margin(10)
        smackChatLabel.pin.hCenter().vCenter(to: sideMenuButton.edge.vCenter).width(100).height(25)
    }


    //MARK: - Button functions
    @objc func openSideMenu() {
        present(SideMenuManager.default.menuLeftNavigationController!, animated: true, completion: nil)
    }
    //MARK: - Helper Functions
    
    func setupMenuBar() {
        self.view.addSubview(topMenuBar)
        topMenuBar.addSubview(smackChatLabel)
        topMenuBar.addSubview(sideMenuButton)
    }
    
    func setupSideMenu() {
        // Define the menus
        let menuVC: SideMenuVC = SideMenuVC()
        SideMenuManager.default.menuLeftNavigationController = UISideMenuNavigationController(rootViewController: menuVC)
        
        // Enable gestures. The left and/or right menus must be set up above for these to work.
        SideMenuManager.default.menuAddScreenEdgePanGesturesToPresent(toView: self.view, forMenu: .left)
        SideMenuManager.default.menuAddScreenEdgePanGesturesToPresent(toView: self.view, forMenu: .left)
        
        //Customization
        SideMenuManager.default.menuWidth = self.view.frame.size.width - 60
    }
}

//MARK: - Extensions
