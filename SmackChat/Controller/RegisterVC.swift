//
//  RegisterVC.swift
//  SmackChat
//
//  Created by Hammoud Hammoud on 12/6/17.
//  Copyright © 2017 Hammoud Hammoud. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController {

    //MARK: - Properties
    
    //Default avatar name and color values
    var avatarName = "profileDefault"
    var avatarColor = "[0.5, 0.5, 0.5, 1]"
    var bgColor: UIColor?
    
    //UI Elements
    let cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("", for: .normal)
        button.setImage(UIImage(named: "closeButton"), for: .normal)
        button.addTarget(self, action: #selector(cancelButtonPressed), for: .touchUpInside)
        
        return button
    }()
    
    let createAccountButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Create Account", for: .normal)
        button.tintColor = .white
        button.backgroundColor = smackBlue
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        
        button.addTarget(self, action: #selector(createButtonPressed), for: .touchUpInside)
        
        return button
    }()
    
    let createAccountLabel: UILabel = {
        let label = UILabel()
        label.text = "Create an account"
        label.textColor = smackPurple
        label.textAlignment = .center
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        
        return label
    }()
    
    let usernameTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.font = UIFont(name: "HelveticaNeue", size: 15)
        textField.textColor = smackPurple
        textField.attributedPlaceholder = NSAttributedString(string: "username", attributes: [NSAttributedStringKey.foregroundColor: smackPurplePlaceHolder])
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.font = UIFont(name: "HelveticaNeue", size: 15)
        textField.textColor = smackPurple
        textField.isSecureTextEntry = true
        textField.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedStringKey.foregroundColor: smackPurplePlaceHolder])
        return textField
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.font = UIFont(name: "HelveticaNeue", size: 15)
        textField.textColor = smackPurple
        textField.attributedPlaceholder = NSAttributedString(string: "email", attributes: [NSAttributedStringKey.foregroundColor: smackPurplePlaceHolder])
        return textField
    }()
    
    let usernameDividerView: UIView = {
        let view = UIView()
        view.backgroundColor = smackBlue
        
        return view
    }()
    
    let passwordDividerView: UIView = {
        let view = UIView()
        view.backgroundColor = smackBlue
        
        return view
    }()
    
    let emailDividerView: UIView = {
        let view = UIView()
        view.backgroundColor = smackBlue
        
        return view
    }()
    
    let chooseAvatarButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Choose avatar", for: .normal)
        button.tintColor = .clear
        button.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 12)
        button.setTitleColor(smackBlue, for: .normal)
        button.contentVerticalAlignment = .bottom
        
        button.addTarget(self, action: #selector(chooseAvatarButtonPressed), for: .touchUpInside)
        
        return button
    }()
    
    let backgroundColorButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Generate background color", for: .normal)
        button.tintColor = .clear
        button.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 12)
        button.setTitleColor(smackBlue, for: .normal)
        
        button.addTarget(self, action: #selector(backgroundColorButtonPressed), for: .touchUpInside)
        
        return button
    }()
    
    let avatarImageView: UIImageView = {
        let imageView = CircleImage()
        imageView.image = #imageLiteral(resourceName: "profileDefault")
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.activityIndicatorViewStyle = .whiteLarge
        indicator.color = smackPurple
        return indicator
    }()

    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        addSubviews()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tap)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDataService.instance.avatarName != "" {
            avatarImageView.image = UIImage(named: UserDataService.instance.avatarName)
            avatarName = UserDataService.instance.avatarName
            if avatarName.contains("light") && bgColor == nil {
                avatarImageView.backgroundColor = .lightGray
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        cancelButton.pin.topRight().marginTop(32).size(30).marginRight(5)
        createAccountLabel.pin.height(48).width(250).top(75).hCenter()
        usernameTextField.pin.width(250).height(30).below(of: createAccountLabel).hCenter().marginTop(40).marginBottom(5)
        usernameDividerView.pin.width(of: usernameTextField).height(2).below(of: usernameTextField).hCenter()
        emailTextField.pin.below(of: usernameDividerView).marginTop(15).width(of: usernameTextField).height(of: usernameTextField).hCenter().marginBottom(5)
        emailDividerView.pin.width(of: usernameTextField).height(2).below(of: emailTextField).hCenter()
        passwordTextField.pin.below(of: emailDividerView).marginTop(15).width(of: usernameTextField).height(of: usernameTextField).hCenter().marginBottom(5)
        passwordDividerView.pin.below(of: passwordTextField).width(of: usernameTextField).height(2).hCenter()
        avatarImageView.pin.size(75).hCenter().below(of: passwordDividerView).marginTop(30)
        chooseAvatarButton.pin.width(100).height(95).hCenter().top(to: avatarImageView.edge.top)
        backgroundColorButton.pin.width(150).height(20).hCenter().below(of: chooseAvatarButton)
        createAccountButton.pin.width(250).height(50).bottom(15).hCenter()
        activityIndicator.pin.hCenter().vCenter(-100).size(30)
    }
    
    //MARK: - Button functions
    
    @objc func cancelButtonPressed(_ sender: Any) {
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
    @objc func createButtonPressed(_ sender: Any) {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        guard let name = usernameTextField.text, usernameTextField.text != "" else {
            print("No username")
            return
        }
        guard let email = emailTextField.text, emailTextField.text != "" else {
            print("No email")
            return
        }
        guard let password = passwordTextField.text , passwordTextField.text != "" else {
            print("No password")
            return
        }
        
        AuthService.instance.registerUser(email: email, password: password) { (success) in
            if success {
                AuthService.instance.loginUser(email: email, password: password, completion: { (success) in
                    if success {
                        AuthService.instance.createUser(name: name, email: email, avatarName: self.avatarName, avatarColor: self.avatarColor, completion: { (success) in
                            if success {
                                self.activityIndicator.isHidden = true
                                self.activityIndicator.stopAnimating()
                                self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
                                NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
                                //Update UI, views, etc.
                            }
                        })
                    }
                })
            }
        }
    }
    
    @objc func chooseAvatarButtonPressed(_ sender: Any) {
        let avatarPicker = AvatarPickerVC()
        present(avatarPicker, animated: true, completion: nil)
    }
    
    @objc func backgroundColorButtonPressed(_ sender: Any) {
        let red = CGFloat(arc4random_uniform(255)) / 255
        let green = CGFloat(arc4random_uniform(255)) / 255
        let blue = CGFloat(arc4random_uniform(255)) / 255
        bgColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        avatarColor = "[\(red), \(green), \(blue), 1]"
        UIView.animate(withDuration: 0.2) {
            self.avatarImageView.backgroundColor = self.bgColor
        }
    }
    
    @objc func handleTap() {
        view.endEditing(true)
    }
    //MARK: - Helper functions
    
    func addSubviews() {
        self.view.addSubview(cancelButton)
        self.view.addSubview(createAccountLabel)
        self.view.addSubview(createAccountButton)
        self.view.addSubview(usernameTextField)
        self.view.addSubview(usernameDividerView)
        self.view.addSubview(passwordTextField)
        self.view.addSubview(passwordDividerView)
        self.view.addSubview(emailTextField)
        self.view.addSubview(emailDividerView)
        self.view.addSubview(avatarImageView)
        self.view.addSubview(chooseAvatarButton)
        self.view.addSubview(backgroundColorButton)
        self.view.addSubview(activityIndicator)
    }

}
