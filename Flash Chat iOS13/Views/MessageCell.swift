//
//  MessageCell.swift
//  Flash Chat iOS13
//
//  Created by bilal on 19/02/2024.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {
    
    @IBOutlet weak var messageBuble: UIView!
    @IBOutlet weak var messageText: UILabel!
    @IBOutlet weak var rightImageView: UIImageView!
    @IBOutlet weak var leftImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        messageBuble.layer.cornerRadius = messageBuble.frame.size.height * 0.3
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
