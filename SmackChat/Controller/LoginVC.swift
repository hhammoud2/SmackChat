//
//  LoginVC.swift
//  SmackChat
//
//  Created by Hammoud Hammoud on 12/6/17.
//  Copyright © 2017 Hammoud Hammoud. All rights reserved.
//

import UIKit
import PinLayout
import SideMenu

final class LoginVC: UIViewController {
    
    //MARK: - Properties
    
    let cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("", for: .normal)
        button.setImage(UIImage(named: "closeButton"), for: .normal)
        button.addTarget(self, action: #selector(cancelButtonPressed), for: .touchUpInside)
        
        return button
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.tintColor = .white
        button.backgroundColor = #colorLiteral(red: 0.3529411765, green: 0.6235294118, blue: 0.7960784314, alpha: 1)
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        button.layer.cornerRadius = 5
        
        button.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        
        return button
    }()
    
    let registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Don't have an account? Sign up here", for: .normal)
        button.tintColor = .clear
        button.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 12)
        button.setTitleColor(#colorLiteral(red: 0.3529411765, green: 0.6235294118, blue: 0.7960784314, alpha: 1), for: .normal)
//        button.titleLabel?.textAlignment = .center

        button.addTarget(self, action: #selector(registerButtonPressed), for: .touchUpInside)

        return button
    }()
    
    let logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "smackLogo")
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    let smackLabel: UILabel = {
        let label = UILabel()
        label.text = "SmackChat"
        label.textColor = #colorLiteral(red: 0.2549019608, green: 0.3294117647, blue: 0.7254901961, alpha: 1)
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        
        return label
    }()
    
    let titleView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        
        return view
    }()
    
    let usernameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "username"
        textField.borderStyle = .none
        textField.font = UIFont(name: "HelveticaNeue", size: 17)
        textField.textColor = #colorLiteral(red: 0.2549019608, green: 0.3294117647, blue: 0.7254901961, alpha: 1)
        
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "password"
        textField.borderStyle = .none
        textField.font = UIFont(name: "HelveticaNeue", size: 17)
        textField.textColor = #colorLiteral(red: 0.2549019608, green: 0.3294117647, blue: 0.7254901961, alpha: 1)
        textField.isSecureTextEntry = true

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
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        addSubviews()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        cancelButton.pin.topRight().marginTop(32).size(30).marginRight(5)
        titleView.pin.height(48).width(221).top(75).hCenter()
        logoImage.pin.width(56).height(48).left().marginRight(12).vCenter()
        smackLabel.pin.width(150).height(30).right().marginLeft(12).vCenter()
        usernameTextField.pin.width(250).height(30).below(of: titleView).hCenter().marginTop(40).marginBottom(5)
        usernameDividerView.pin.width(of: usernameTextField).height(2).below(of: usernameTextField).hCenter()
        passwordTextField.pin.below(of: usernameDividerView).marginTop(15).width(of: usernameTextField).height(of: usernameTextField).hCenter().marginBottom(5)
        passwordDividerView.pin.width(of: usernameTextField).height(2).below(of: passwordTextField).hCenter()
        loginButton.pin.height(50).width(250).below(of: passwordDividerView).hCenter().marginTop(40)
        registerButton.pin.height(20).width(250).below(of: loginButton, aligned: .center)
    }
    
    //MARK: - Button functions
    
    @objc func cancelButtonPressed() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func loginButtonPressed() {
        print("Login!")
//        let presentingVC = presentingViewController as? SideMenu.UISideMenuNavigationController
//        let sideMenuVC = presentingVC?.topViewController as? SideMenuVC
        dismiss(animated: true, completion: nil)
    }
    
    @objc func registerButtonPressed() {
        //Open register VC
    }
    
    //MARK: - Helper functions
    func addSubviews() {
        self.view.addSubview(cancelButton)
        self.view.addSubview(loginButton)
        self.view.addSubview(registerButton)
        self.view.addSubview(titleView)
        self.view.addSubview(usernameTextField)
        self.view.addSubview(usernameDividerView)
        self.view.addSubview(passwordTextField)
        self.view.addSubview(passwordDividerView)
        
        titleView.addSubview(logoImage)
        titleView.addSubview(smackLabel)
        
    }
}