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

    //MARK: - Properties
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
        let imageView = UIImageView()
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
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addSubviews()
        channelsTable.delegate = self
        channelsTable.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        smackLabel.pin.top().left().width(75).height(30).marginHorizontal(15).marginVertical(45)
        channelsLabel.pin.below(of: smackLabel).left().width(190).height(30).marginHorizontal(15).marginVertical(25)
        addChannelButton.pin.right().size(30).vCenter(to: channelsLabel.edge.vCenter).marginHorizontal(30)
        avatarImageView.pin.bottomLeft().size(90).margin(20)
        loginButton.pin.after(of: avatarImageView).vCenter(to: avatarImageView.edge.vCenter).marginHorizontal(15).width(70).height(30)
        channelsTable.pin.below(of: channelsLabel).above(of: avatarImageView).left().right().marginTop(15).marginBottom(10)
    }
    
    //MARK: - Helper functions
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
    //MARK: - Button functions
    @objc func createChannel(_ sender: Any) {
        
    }
    
    @objc func promptLogin(_ sender: Any) {
        let loginVC: LoginVC = LoginVC()
        present(loginVC, animated: true, completion: nil)
    }
}

//MARK: - Tableview Extension
extension SideMenuVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "channel cell") as? ChannelCell {
            //Change channel name
            return cell
        }
        else {
            return ChannelCell()
        }
    }
    
}
