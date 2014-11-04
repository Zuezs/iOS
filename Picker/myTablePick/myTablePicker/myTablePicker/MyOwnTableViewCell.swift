//
//  MyOwnTableViewCell.swift
//  myTablePicker
//
//  Created by Tyron Allen on 11/3/14.
//  Copyright (c) 2014 Tyron Allen. All rights reserved.
//

import UIKit



class MyOwnTableViewCell: UITableViewCell {

    @IBOutlet weak var MyLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
