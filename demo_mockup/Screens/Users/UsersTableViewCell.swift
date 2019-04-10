//
//  UsersTableViewCell.swift
//  demo_mockup
//
//  Created by Henrik on 2019-04-10.
//  Copyright © 2019 Henrik. All rights reserved.
//

import UIKit

class UsersTableViewCell: UITableViewCell {

    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    static var identifier: String {
        return "UsersTableViewCell"
    }

    func setContent() {
        idLabel.text = ""
        nameLabel.text = ""
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
