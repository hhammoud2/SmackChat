//
//  AddChannelVC.swift
//  SmackChat
//
//  Created by Hammoud Hammoud on 12/12/17.
//  Copyright © 2017 Hammoud Hammoud. All rights reserved.
//

import UIKit

class AddChannelVC: UIViewController {

    // MARK: - Properties
    
    let addChannelView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        
        return view
    }()
    
    let createChannelLabel: UILabel = {
        let label = UILabel()
        label.text = "Create Channel"
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 23)
        label.textColor = smackPurple
        
        return label
    }()
    
    let createChannelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Create Channel", for: .normal)
        button.tintColor = .white
        button.backgroundColor = smackBlue
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(createChannelButtonPressed), for: .touchUpInside)
        
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
    
    let channelNameTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.font = UIFont(name: "HelveticaNeue", size: 17)
        textField.textColor = smackPurple
        textField.attributedPlaceholder = NSAttributedString(string: "name", attributes: [NSAttributedStringKey.foregroundColor: smackPurplePlaceHolder])
        return textField
    }()
    
    let channelDescriptionTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.font = UIFont(name: "HelveticaNeue", size: 17)
        textField.textColor = smackPurple
        textField.attributedPlaceholder = NSAttributedString(string: "description", attributes: [NSAttributedStringKey.foregroundColor: smackPurplePlaceHolder])
        
        return textField
    }()
    
    let nameDividerView: UIView = {
        let view = UIView()
        view.backgroundColor = smackBlue
        
        return view
    }()
    
    let descriptionDividerView: UIView = {
        let view = UIView()
        view.backgroundColor = smackBlue
        
        return view
    }()
    
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
        channelDescriptionTextField.delegate = self
        addSubviews()
        
    }
    
    override func viewDidLayoutSubviews() {
        addChannelView.pin.top(50).width(UIScreen.main.bounds.size.width - 50).height(UIScreen.main.bounds.size.width - 100).hCenter()
        createChannelLabel.pin.top().marginTop(50).sizeToFit(.widthFlexible).hCenter()
        cancelButton.pin.topRight().margin(10).size(30)
        channelNameTextField.pin.width(250).height(30).below(of:createChannelLabel).hCenter().marginTop(25).marginBottom(5)
        nameDividerView.pin.width(of: channelNameTextField).height(2).below(of: channelNameTextField).hCenter()
        channelDescriptionTextField.pin.width(of: channelNameTextField).marginTop(15).below(of: nameDividerView).height(of: channelNameTextField).hCenter().marginBottom(5)
        descriptionDividerView.pin.width(of: channelNameTextField).height(2).below(of: channelDescriptionTextField).hCenter()
        createChannelButton.pin.below(of: descriptionDividerView).width(of: channelNameTextField).height(50).hCenter().marginTop(20)
    }
    
    // MARK: - Button functions
    
    @objc func createChannelButtonPressed(_ sender: Any) {

    }
    
    @objc func cancelPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: - Helper functions
    
    func addSubviews() {
        self.view.addSubview(addChannelView)
        addChannelView.addSubview(createChannelLabel)
        addChannelView.addSubview(cancelButton)
        addChannelView.addSubview(channelNameTextField)
        addChannelView.addSubview(nameDividerView)
        addChannelView.addSubview(channelDescriptionTextField)
        addChannelView.addSubview(descriptionDividerView)
        addChannelView.addSubview(createChannelButton)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch? = touches.first
        
        if touch?.view == self.view {
            dismiss(animated: true, completion: nil)
        }
    }
}

extension AddChannelVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("entered")
        performAction()
        return true
        
    }
    
    func performAction() {
        createChannelButtonPressed(createChannelButton)
    }
}
