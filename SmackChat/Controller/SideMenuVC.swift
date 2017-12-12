//
//  SideMenuVC.swift
//  SmackChat
//
//  Created by Hammoud Hammoud on 12/5/17.
//  Copyright © 2017 Hammoud Hammoud. All rights reserved.
//

import UIKit
import PinLayout

final class SideMenuVC: UIViewController {

    // MARK: - Properties
    
    let smackLabel: UILabel = {
        let label = UILabel()
        label.text = "Smack"
        label.textColor = .white
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 21)
        
        return label
    }()
    
    let channelsLabel: UILabel = {
        let label = UILabel()
        label.text = "CHANNELS"
        label.textColor = .white
        label.font = UIFont(name: "HelveticaNeue", size: 14)
        
        return label
    }()
    
    let addChannelButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.setTitle("", for: .normal)
        button.setImage(UIImage(named: "addChannelButton"), for: .normal)
        button.addTarget(self, action: #selector(createChannel), for: .touchUpInside)
        
        return button
    }()
    
    let avatarImageView: UIImageView = {
        let imageView = CircleImage()
        imageView.image = #imageLiteral(resourceName: "menuProfileIcon")
        
        return imageView
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.title
        button.tintColor = .white
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 19)
        button.addTarget(self, action: #selector(promptLogin), for: .touchUpInside)
        return button
    }()
    
    let channelsTable: UITableView = {
        let table = UITableView()
        table.backgroundColor = .clear
        table.separatorStyle = .none
        table.register(ChannelCell.self, forCellReuseIdentifier: "channel cell")
        table.rowHeight = 25
        table.showsVerticalScrollIndicator = false
        table.showsHorizontalScrollIndicator = false
        
        return table
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addSubviews()
        channelsTable.delegate = self
        channelsTable.dataSource = self
        NotificationCenter.default.addObserver(self, selector: #selector(userDataDidChange), name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupUserInfo()
    }
    
    override func viewDidLayoutSubviews() {
        smackLabel.pin.top().left().width(75).height(30).marginHorizontal(15).marginVertical(45)
        channelsLabel.pin.below(of: smackLabel).left().width(190).height(30).marginHorizontal(15).marginVertical(25)
        addChannelButton.pin.right().size(30).vCenter(to: channelsLabel.edge.vCenter).marginHorizontal(30)
        avatarImageView.pin.bottomLeft().size(90).margin(20)
        loginButton.pin.after(of: avatarImageView).vCenter(to: avatarImageView.edge.vCenter).marginHorizontal(15).right(to: avatarImageView.edge.right).height(30).sizeToFit(.widthFlexible)
        channelsTable.pin.below(of: channelsLabel).above(of: avatarImageView).left().right().marginTop(15).marginBottom(10)
    }
    
    // MARK: - Helper functions
    
    func setupView() {
        self.view.backgroundColor = .white
        self.view = GradientView()
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func addSubviews() {
        self.view.addSubview(smackLabel)
        self.view.addSubview(channelsLabel)
        self.view.addSubview(addChannelButton)
        self.view.addSubview(avatarImageView)
        self.view.addSubview(loginButton)
        self.view.addSubview(channelsTable)
    }
    
    func setupUserInfo() {
        if AuthService.instance.isLoggedIn {
            loginButton.setTitle(UserDataService.instance.name, for: .normal)
            avatarImageView.image = UIImage(named: UserDataService.instance.avatarName)
            avatarImageView.backgroundColor = UserDataService.instance.returnUIColor(components: UserDataService.instance.avatarColor)
            loginButton.pin.sizeToFit(.widthFlexible)
        }
        else {
            loginButton.setTitle("Login", for: .normal)
            avatarImageView.image = UIImage(named: "menuProfileIcon")
            avatarImageView.backgroundColor = .clear
            loginButton.pin.sizeToFit(.widthFlexible)
        }
        channelsTable.reloadData()
    }
    
    @objc func userDataDidChange(_ notif: Notification) {
        setupUserInfo()
    }
    
    // MARK: - Button functions
    
    @objc func createChannel(_ sender: Any) {
        if AuthService.instance.isLoggedIn {
            let addChannelVC = AddChannelVC()
            addChannelVC.modalPresentationStyle = .custom
            present(addChannelVC, animated: true, completion: nil)
        }
        else {
            //Display error window?
        }
    }
    
    @objc func promptLogin(_ sender: UIButton) {
        if AuthService.instance.isLoggedIn {
            let profileVC = ProfileVC()
            profileVC.modalPresentationStyle = .custom
            present(profileVC, animated: true, completion: nil)
        }
        else {
            let loginVC: LoginVC = LoginVC()
            loginVC.modalPresentationStyle = .overFullScreen
            present(loginVC, animated: true, completion: nil)
        }
    }
}

// MARK: - Tableview Extension

extension SideMenuVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MessageService.instance.channels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "channel cell") as? ChannelCell {
            cell.configureCell(channel: MessageService.instance.channels[indexPath.row])
            return cell
        }
        else {
            return ChannelCell()
        }
    }
}
