//
//  ProfileVC.swift
//  SmackChat
//
//  Created by Hammoud Hammoud on 12/8/17.
//  Copyright © 2017 Hammoud Hammoud. All rights reserved.
//

import UIKit
import PinLayout

class ProfileVC: UIViewController {
    
    //MARK: - Properties
    let profileLabel: UILabel = {
        let label = UILabel()
        label.text = "Your Profile"
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        label.textColor = smackPurple
        
        return label
    }()
    
    let avatarImage: UIImageView = {
        let imageView = CircleImage()
        imageView.image = UIImage(named: "\(UserDataService.instance.avatarName)")
        imageView.backgroundColor = UserDataService.instance.returnUIColor(components: UserDataService.instance.avatarColor)
        
        return imageView
    }()
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = UserDataService.instance.name
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 17)
        label.textColor = smackPurple
        
        return label
    }()
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.text = UserDataService.instance.email
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 17)
        label.textColor = smackPurple
        
        return label
    }()
    
    let logoutButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Logout", for: .normal)
        button.tintColor = smackPurple
        button.addTarget(self, action: #selector(logoutPressed), for: .touchUpInside)
        
        return button
    }()
    
    let cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("", for: .normal)
        button.setImage(#imageLiteral(resourceName: "closeButton"), for: .normal)
        button.tintColor = smackPurple
        button.addTarget(self, action: #selector(cancelPressed), for: .touchUpInside)
        
        return button
    }()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        
    }
    
    //MARK: - Helper functions
    func addSubviews() {
        
    }
    
    @objc func cancelPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func logoutPressed(_ sender: Any) {
        
    }
}
