//
//  CategoryCell.swift
//  ShopiOS
//
//  Created by thiet on 4/23/20.
//  Copyright © 2020 Ân Lê. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {
    @IBOutlet weak var viewCategory: UIView!
    @IBOutlet weak var lbCateGory: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
