//
//  UserDataService.swift
//  SmackChat
//
//  Created by Hammoud Hammoud on 12/7/17.
//  Copyright © 2017 Hammoud Hammoud. All rights reserved.
//

import Foundation

class UserDataService {
    
    static let instance = UserDataService()
    
    private(set) var id = ""
    private(set) var avatarColor = ""
    private(set) var avatarName = ""
    private(set) var email = ""
    private(set) var name = ""
    
    func setUserData(id: String, color: String, avatarName: String, email: String, name: String) {
        self.id = id
        self.avatarColor = color
        self.avatarName = avatarName
        self.email = email
        self.name = name
        print(id, avatarColor, avatarName, email, name)
    }
    
    func setAvatarName(avatarName: String) {
        self.avatarName = avatarName
    }
}
