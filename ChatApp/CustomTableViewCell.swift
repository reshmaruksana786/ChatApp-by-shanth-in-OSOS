//
//  CustomTableViewCell.swift
//  ChatApp
//
//  Created by Vidushi Duhan on 05/02/20.
//  Copyright © 2020 Vidushi Duhan. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    
    @IBOutlet weak var messageText: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
        
        messageText.textColor = .black
        
        messageText.layer.cornerRadius = 10
        messageText.clipsToBounds = true

        // Configure the view for the selected state
    }
    
}
