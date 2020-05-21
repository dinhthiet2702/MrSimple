//
//  InfoPersonCell.swift
//  ShopiOS
//
//  Created by thiet on 5/19/20.
//  Copyright © 2020 Ân Lê. All rights reserved.
//

import UIKit

class InfoPersonCell: UITableViewCell {

    @IBOutlet weak var btnImgPerson: UIButton!
    @IBOutlet weak var lbNamePerson: UILabel!
    @IBOutlet weak var lbPhonePerson: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
