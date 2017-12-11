//
//  Constants.swift
//  SmackChat
//
//  Created by Hammoud Hammoud on 12/7/17.
//  Copyright © 2017 Hammoud Hammoud. All rights reserved.
//

import UIKit

typealias CompletionHandler = (_ Success: Bool) -> ()

// URL Constants
let BASE_URL = "https://smackchatchatsmack.herokuapp.com/v1/"
let REGISTER_URL = "\(BASE_URL)account/register"
let LOGIN_URL = "\(BASE_URL)account/login"
let ADD_USER_URL = "\(BASE_URL)user/add"


// User Defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"


// Headers
let HEADER = [
    "Content-Type": "application/json; charset=utf-8"
]

// Notification Constants
let NOTIF_USER_DATA_DID_CHANGE = Notification.Name("notifUserDataChange")

// Colors
let smackPurplePlaceHolder = #colorLiteral(red: 0.2549019608, green: 0.3294117647, blue: 0.7254901961, alpha: 0.5)
let smackPurple = #colorLiteral(red: 0.2549019608, green: 0.3294117647, blue: 0.7254901961, alpha: 1)
let smackBlue = #colorLiteral(red: 0.3529411765, green: 0.6235294118, blue: 0.7960784314, alpha: 1)
let gradientBlue = #colorLiteral(red: 0.1725490196, green: 0.831372549, blue: 0.8470588235, alpha: 1)

