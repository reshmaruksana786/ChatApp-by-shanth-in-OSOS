//
//  Custom2TableViewCell.swift
//  ChatApp
//
//  Created by Vidushi Duhan on 05/02/20.
//  Copyright © 2020 Vidushi Duhan. All rights reserved.
//

import UIKit

class Custom2TableViewCell: UITableViewCell {

    @IBOutlet weak var messageLbl2: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        messageLbl2.layer.cornerRadius = 10
        messageLbl2.clipsToBounds = true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
