//
//  ChannelCell.swift
//  SmackChat
//
//  Created by Hammoud Hammoud on 12/6/17.
//  Copyright © 2017 Hammoud Hammoud. All rights reserved.
//

import UIKit

final class ChannelCell: UITableViewCell {

    // MARK: - Properties
    let channelNameLabel: UILabel = {
        let label = UILabel()
        label.text = "#general"
        label.textColor = .white
        label.font = UIFont(name: "HelveticaNeue", size: 16)
        label.textAlignment = .left
        
        return label
    }()
    
    // MARK: - Initializers
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:)")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        

        selectionStyle = .none
        self.backgroundColor = .clear
        contentView.addSubview(channelNameLabel)
        contentView.contentMode = .center
        layoutSubviews()

    }
    
    // MARK: - Helper functions
    override func layoutSubviews() {
        channelNameLabel.pin.left().top().bottom().marginHorizontal(20).width(self.contentView.frame.size.width/3)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            self.layer.backgroundColor = UIColor(white: 1, alpha: 0.2).cgColor
        }
        else {
            self.layer.backgroundColor = UIColor.clear.cgColor
        }
    }
    
    func configureCell(channel: Channel) {
        let title = channel.name ?? ""
        channelNameLabel.text = "#\(title)"
    }

}
