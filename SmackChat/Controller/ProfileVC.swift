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
    
    // MARK: - Properties
    
    let profileView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        
        return view
    }()
    
    let profileLabel: UILabel = {
        let label = UILabel()
        label.text = "Your Profile"
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 23)
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
        label.font = UIFont(name: "HelveticaNeue-Medium", size: 17)
        label.textColor = smackPurple
        
        return label
    }()
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.text = UserDataService.instance.email
        label.font = UIFont(name: "HelveticaNeue-Medium", size: 17)
        label.textColor = smackPurple
        
        return label
    }()
    
    let logoutButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Logout", for: .normal)
        button.tintColor = smackPurple
        button.setTitleColor(smackPurple, for: .normal)
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
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
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
        addSubviews()
    }
    
    override func viewDidLayoutSubviews() {
        profileView.pin.center().size(UIScreen.main.bounds.size.width - 50)
        profileLabel.pin.top().marginTop(50).sizeToFit(.widthFlexible).hCenter()
        avatarImage.pin.size(90).below(of: profileLabel).hCenter().marginVertical(20)
        usernameLabel.pin.below(of: avatarImage).sizeToFit(.widthFlexible).hCenter().marginTop(20).marginBottom(10)
        emailLabel.pin.below(of: usernameLabel).sizeToFit(.widthFlexible).hCenter()
        cancelButton.pin.topRight().margin(10).size(30)
        logoutButton.pin.bottom().sizeToFit(.widthFlexible).marginBottom(15).hCenter()

    }
    
    // MARK: - Helper functions
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch? = touches.first
        
        if touch?.view == self.view {
            dismiss(animated: true, completion: nil)
        }
    }
    
    func addSubviews() {
        self.view.addSubview(profileView)
        profileView.addSubview(profileLabel)
        profileView.addSubview(avatarImage)
        profileView.addSubview(usernameLabel)
        profileView.addSubview(emailLabel)
        profileView.addSubview(cancelButton)
        profileView.addSubview(logoutButton)
    }
    
    
    @objc func cancelPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func logoutPressed(_ sender: Any) {
        UserDataService.instance.logoutUser()
        NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
        dismiss(animated: true, completion: nil)
    }
}
