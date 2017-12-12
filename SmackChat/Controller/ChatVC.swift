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

final class ChatVC: UIViewController {

    // MARK: - Properties
    
    let topMenuBar: UIView = {
        let view = GradientView()
        return view
    }()
    
    let smackChatLabel: UILabel = {
        let label = UILabel()
        label.text = "Smack Chat"
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 17.0)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    let sideMenuButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.setTitle("", for: .normal)
        button.setImage(UIImage(named: "smackBurger"), for: .normal)
        button.addTarget(self, action: #selector(openSideMenu), for: .touchUpInside)
        return button
    }()
    
    let messageTextField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Message: #\(MessageService.instance.selectedChannel?.name ?? "")"
        textfield.borderStyle = .none
        textfield.font = UIFont(name: "HelveticaNeue", size: 12)
        textfield.textColor = .black
        textfield.autocapitalizationType = UITextAutocapitalizationType.sentences
        
        return textfield
    }()
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Running")
        self.view.backgroundColor = .white
        setupMenuBar()
        setupSideMenu()
        
        NotificationCenter.default.addObserver(self, selector: #selector(userDataDidChange), name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(channelSelected), name: NOTIF_CHANNEL_SELECTED, object: nil)
        
        if AuthService.instance.isLoggedIn {
            AuthService.instance.findUserByEmail(completion: { (success) in
                NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
            })
        }
    }
    
    override func viewDidLayoutSubviews() {
        // Menubar layout
        topMenuBar.pin.top().left().right().height(75)
        sideMenuButton.pin.width(24).height(20).bottomLeft().margin(8)
        smackChatLabel.pin.hCenter().vCenter(to: sideMenuButton.edge.vCenter).width(150).height(25)
        messageTextField.pin.bottom().left().right()
    }


    // MARK: - Button functions
    
    @objc func openSideMenu(_ sender: Any) {
        present(SideMenuManager.default.menuLeftNavigationController!, animated: true, completion: nil)
    }
    
    @objc func userDataDidChange(_ notif: Notification) {
        if AuthService.instance.isLoggedIn {
            onLoginGetMessages()
        }
        else {
            smackChatLabel.text = "Please Log In"
        }
    }
    // MARK: - Helper Functions
    
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
        SideMenuManager.default.menuFadeStatusBar = false
        SideMenuManager.default.menuDismissOnPush = false
    }
    
    func onLoginGetMessages() {
        MessageService.instance.getChannels { (success) in
            if success {
                if MessageService.instance.channels.count > 0 {
                    MessageService.instance.selectedChannel = MessageService.instance.channels[0]
                    self.updateWithChannel()
                }
                else {
                    self.smackChatLabel.text = "No channels yet!"
                }
            }
        }
    }
    
    func getMessages() {
        guard let channelID = MessageService.instance.selectedChannel?._id else {
            return
        }
        MessageService.instance.getAllMessages(forChannelID: channelID) { (success) in
            
        }
    }
    
    @objc func channelSelected(_ notif: Notification) {
        updateWithChannel()
    }
    
    func updateWithChannel() {
        let channelName = MessageService.instance.selectedChannel?.name ?? ""
        smackChatLabel.text = "#\(channelName)"
        getMessages()
    }
}

// MARK: - Extensions

