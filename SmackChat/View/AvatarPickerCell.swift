//
//  AvatarPickerCell.swift
//  SmackChat
//
//  Created by Hammoud Hammoud on 12/8/17.
//  Copyright © 2017 Hammoud Hammoud. All rights reserved.
//

import UIKit

enum AvatarType {
    case dark
    case light
}

class AvatarPickerCell: UICollectionViewCell {
    //MARK: - Properties
    let avatarImageView: UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "dark11")
        
        return image
    }()
    
    //MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.backgroundColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        self.contentView.addSubview(avatarImageView)
        layoutSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - Helper functions
    override func layoutSubviews() {
        avatarImageView.pin.all().margin(10)
    }
    
    func configureCell(index: Int, type: AvatarType) {
        if type == AvatarType.dark {
            avatarImageView.image = UIImage(named: "dark\(index)")
            self.layer.backgroundColor = UIColor.lightGray.cgColor
        }
        else {
            avatarImageView.image = UIImage(named: "light\(index)")
            self.layer.backgroundColor = UIColor.gray.cgColor
        }
    }
}
