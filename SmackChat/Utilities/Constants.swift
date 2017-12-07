//
//  Constants.swift
//  SmackChat
//
//  Created by Hammoud Hammoud on 12/7/17.
//  Copyright © 2017 Hammoud Hammoud. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool) -> ()

// URL Constants
let BASE_URL = "https://smackchatchatsmack.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"

// User Defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedin"
let USER_EMAIL = "userEmail"
