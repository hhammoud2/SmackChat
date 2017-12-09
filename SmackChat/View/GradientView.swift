//
//  GradientView.swift
//  SmackChat
//
//  Created by Hammoud Hammoud on 12/5/17.
//  Copyright © 2017 Hammoud Hammoud. All rights reserved.
//

import UIKit

final class GradientView: UIView {

    var topColor: UIColor = smackPurple {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    var bottomColor: UIColor = gradientBlue {
        didSet{
            self.setNeedsLayout()
        }
    }
    
    override func layoutSubviews() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}
