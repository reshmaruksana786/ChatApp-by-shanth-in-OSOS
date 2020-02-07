//
//  ContactsTableViewCell.swift
//  ChatApp
//
//  Created by Vidushi Duhan on 06/02/20.
//  Copyright © 2020 Vidushi Duhan. All rights reserved.
//

import UIKit

class ContactsTableViewCell: UITableViewCell {

    @IBOutlet weak var contactLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contactLbl.layer.cornerRadius = 10
        contactLbl.clipsToBounds = true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
