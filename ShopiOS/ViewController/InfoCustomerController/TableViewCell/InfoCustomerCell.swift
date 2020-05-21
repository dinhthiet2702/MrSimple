//
//  InfoCustomerCell.swift
//  ShopiOS
//
//  Created by thiet on 5/15/20.
//  Copyright © 2020 Ân Lê. All rights reserved.
//

import UIKit

class InfoCustomerCell: UITableViewCell {

    @IBOutlet weak var tfFullName: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPhoneNumber: UITextField!
    @IBOutlet weak var tfAdress: UITextField!
    @IBOutlet weak var tfCity: UITextField!
    @IBOutlet weak var tfQuanHuyen: UITextField!
    @IBOutlet weak var tfPhuongXa: UITextField!
    @IBOutlet weak var btnSaveCustomer: UIButton!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func clickSaveCustomer(_ sender: UIButton) {
        
    }
    
}
