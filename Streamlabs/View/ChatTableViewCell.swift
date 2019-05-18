//
//  ChatTableViewCell.swift
//  Streamlabs
//
//  Created by Fernando Gallo on 17/05/19.
//  Copyright © 2019 Fernando Gallo. All rights reserved.
//

import UIKit

class ChatTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    static let cellIdentifier = "ChatCell"
    static let cellHeight: CGFloat = 28.0

    func configure(message: Message) {
        userNameLabel.text = message.userName
        messageLabel.text = message.text
    }
    
}
