//
//  CircleImage.swift
//  SmackChat
//
//  Created by Hammoud Hammoud on 12/8/17.
//  Copyright © 2017 Hammoud Hammoud. All rights reserved.
//

import UIKit

class CircleImage: UIImageView {

    override func layoutSubviews() {
        self.layer.cornerRadius = self.frame.width/2
        self.clipsToBounds = true
    }

}
