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
    var avatarColor = "[0.5, 0.5, 0.5, 1.0]"
    
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
        button.backgroundColor = #colorLiteral(red: 0.3529411765, green: 0.6235294118, blue: 0.7960784314, alpha: 1)
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        button.layer.cornerRadius = 5
        
        button.addTarget(self, action: #selector(createButtonPressed), for: .touchUpInside)
        
        return button
    }()
    
    let createAccountLabel: UILabel = {
        let label = UILabel()
        label.text = "Create an account"
        label.textColor = #colorLiteral(red: 0.2549019608, green: 0.3294117647, blue: 0.7254901961, alpha: 1)
        label.textAlignment = .center
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        
        return label
    }()
    
    let usernameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "username"
        textField.borderStyle = .none
        textField.font = UIFont(name: "HelveticaNeue", size: 15)
        textField.textColor = #colorLiteral(red: 0.2549019608, green: 0.3294117647, blue: 0.7254901961, alpha: 1)
        
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "password"
        textField.borderStyle = .none
        textField.font = UIFont(name: "HelveticaNeue", size: 15)
        textField.textColor = #colorLiteral(red: 0.2549019608, green: 0.3294117647, blue: 0.7254901961, alpha: 1)
        textField.isSecureTextEntry = true
        
        return textField
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "email"
        textField.borderStyle = .none
        textField.font = UIFont(name: "HelveticaNeue", size: 15)
        textField.textColor = #colorLiteral(red: 0.2549019608, green: 0.3294117647, blue: 0.7254901961, alpha: 1)
        
        return textField
    }()
    
    let usernameDividerView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.3568627451, green: 0.6235294118, blue: 0.7960784314, alpha: 1)
        
        return view
    }()
    
    let passwordDividerView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.3568627451, green: 0.6235294118, blue: 0.7960784314, alpha: 1)
        
        return view
    }()
    
    let emailDividerView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.3568627451, green: 0.6235294118, blue: 0.7960784314, alpha: 1)
        
        return view
    }()
    
    let chooseAvatarButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Choose avatar", for: .normal)
        button.tintColor = .clear
        button.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 12)
        button.setTitleColor(#colorLiteral(red: 0.3529411765, green: 0.6235294118, blue: 0.7960784314, alpha: 1), for: .normal)
        button.contentVerticalAlignment = .bottom
        
        button.addTarget(self, action: #selector(chooseAvatarButtonPressed), for: .touchUpInside)
        
        return button
    }()
    
    let backgroundColorButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Generate background color", for: .normal)
        button.tintColor = .clear
        button.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 12)
        button.setTitleColor(#colorLiteral(red: 0.3529411765, green: 0.6235294118, blue: 0.7960784314, alpha: 1), for: .normal)
        
        button.addTarget(self, action: #selector(backgroundColorButtonPressed), for: .touchUpInside)
        
        return button
    }()
    
    let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "profileDefault")
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()

    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        addSubviews()
        // Do any additional setup after loading the view.
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

    }
    
    //MARK: - Button functions
    
    @objc func cancelButtonPressed(_ sender: Any) {
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
    @objc func createButtonPressed(_ sender: Any) {
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
                            print(success)
                            if success {
                                print(UserDataService.instance.name, UserDataService.instance.avatarName)
                                self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
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
    }

}
