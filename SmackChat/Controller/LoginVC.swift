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
    
    // MARK: - Properties
    
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
        button.backgroundColor = smackBlue
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        
        button.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        
        return button
    }()
    
    let registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Don't have an account? Sign up here", for: .normal)
        button.tintColor = .clear
        button.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 12)
        button.setTitleColor(smackBlue, for: .normal)
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
        label.textColor = smackPurple
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        
        return label
    }()
    
    let titleView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        
        return view
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.font = UIFont(name: "HelveticaNeue", size: 17)
        textField.textColor = smackPurple
        textField.attributedPlaceholder = NSAttributedString(string: "email", attributes: [NSAttributedStringKey.foregroundColor: smackPurplePlaceHolder])
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.font = UIFont(name: "HelveticaNeue", size: 17)
        textField.textColor = smackPurple
        textField.isSecureTextEntry = true
        textField.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedStringKey.foregroundColor: smackPurplePlaceHolder])

        return textField
    }()
    
    let emailDividerView: UIView = {
        let view = UIView()
        view.backgroundColor = smackBlue
        
        return view
    }()
    
    let passwordDividerView: UIView = {
        let view = UIView()
        view.backgroundColor = smackBlue
        
        return view
    }()
    
    let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.activityIndicatorViewStyle = .whiteLarge
        indicator.color = smackPurple
        indicator.isHidden = true
        
        return indicator
    }()

    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        passwordTextField.delegate = self
        addSubviews()
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        cancelButton.pin.topRight().marginTop(32).size(30).marginRight(5)
        titleView.pin.height(48).width(221).top(75).hCenter()
        logoImage.pin.width(56).height(48).left().marginRight(12).vCenter()
        smackLabel.pin.width(150).height(30).right().marginLeft(12).vCenter()
        emailTextField.pin.width(250).height(30).below(of: titleView).hCenter().marginTop(40).marginBottom(5)
        emailDividerView.pin.width(of: emailTextField).height(2).below(of: emailTextField).hCenter()
        passwordTextField.pin.below(of: emailDividerView).marginTop(15).width(of: emailTextField).height(of: emailTextField).hCenter().marginBottom(5)
        passwordDividerView.pin.width(of: emailTextField).height(2).below(of: passwordTextField).hCenter()
        loginButton.pin.height(50).width(250).below(of: passwordDividerView).hCenter().marginTop(40)
        registerButton.pin.height(20).width(250).below(of: loginButton, aligned: .center)
        activityIndicator.pin.hCenter().vCenter(-100).size(30)

    }
    
    // MARK: - Button functions
    
    @objc func cancelButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func loginButtonPressed(_ sender: Any) {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        
        guard let email = emailTextField.text, emailTextField.text != "" else {
            return
        }
        guard let password = passwordTextField.text, passwordTextField.text != "" else {
            return
        }
        
        AuthService.instance.loginUser(email: email, password: password) { (success) in
            if success {
                AuthService.instance.findUserByEmail(completion: { (success) in
                    if success {
                        NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
                        self.activityIndicator.isHidden = true
                        self.activityIndicator.stopAnimating()
                        self.dismiss(animated: true, completion: nil)
                    }
                })
            }
        }
    }
    
    @objc func registerButtonPressed(_ sender: Any) {
        let registerVC = RegisterVC()
        registerVC.modalPresentationStyle = .overFullScreen
        presentingViewController?.presentSecondaryDetail(registerVC)
//        let presentingVC = presentingViewController
//        dismiss(animated: false) {
//            presentingVC?.present(registerVC, animated: true, completion: nil)
//        }
    }
    
    @objc func handleTap() {
        view.endEditing(true)
    }
    
    // MARK: - Helper functions
    func addSubviews() {
        self.view.addSubview(cancelButton)
        self.view.addSubview(loginButton)
        self.view.addSubview(registerButton)
        self.view.addSubview(titleView)
        self.view.addSubview(emailTextField)
        self.view.addSubview(emailDividerView)
        self.view.addSubview(passwordTextField)
        self.view.addSubview(passwordDividerView)
        self.view.addSubview(activityIndicator)
        
        titleView.addSubview(logoImage)
        titleView.addSubview(smackLabel)
        
    }
}

extension LoginVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("entered")
        performAction()
        return true

    }
    
    func performAction() {
        loginButtonPressed(loginButton)
    }
}
