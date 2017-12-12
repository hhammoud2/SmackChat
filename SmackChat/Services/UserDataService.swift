//
//  UserDataService.swift
//  SmackChat
//
//  Created by Hammoud Hammoud on 12/7/17.
//  Copyright © 2017 Hammoud Hammoud. All rights reserved.
//

import UIKit

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
    }
    
    func setAvatarName(avatarName: String) {
        self.avatarName = avatarName
    }
    
    func returnUIColor(components: String) -> UIColor {
        let scanner = Scanner(string: components)
        let skipped = CharacterSet(charactersIn: "[], ")
        let comma = CharacterSet(charactersIn: ",")
        scanner.charactersToBeSkipped = skipped
        
        var red, green, blue, alpha: NSString?
        
        scanner.scanUpToCharacters(from: comma, into: &red)
        scanner.scanUpToCharacters(from: comma, into: &green)
        scanner.scanUpToCharacters(from: comma, into: &blue)
        scanner.scanUpToCharacters(from: comma, into: &alpha)
        
        let defaultColor = UIColor.lightGray
        guard let redUnwrapped = red, let greenUnwrapped = green, let blueUnwrapped = blue, let alphaUnwrapped = alpha else {
            return defaultColor
        }
        
        let redFloat = CGFloat(redUnwrapped.doubleValue)
        let greenFloat = CGFloat(greenUnwrapped.doubleValue)
        let blueFloat = CGFloat(blueUnwrapped.doubleValue)
        let alphaFloat = CGFloat(alphaUnwrapped.doubleValue)
        
        let newColor = UIColor(red: redFloat, green: greenFloat, blue: blueFloat, alpha: alphaFloat)
        
        return newColor
    }
    
    func logoutUser() {
        id = ""
        avatarName = ""
        avatarColor = ""
        email = ""
        name = ""
        AuthService.instance.isLoggedIn = false
        AuthService.instance.userEmail = ""
        AuthService.instance.authToken = ""
        MessageService.instance.clearChannels()
    }
}
