//
//  ShopCartProductsCell.swift
//  ShopiOS
//
//  Created by thiet on 5/12/20.
//  Copyright © 2020 Ân Lê. All rights reserved.
//

import UIKit

class ShopCartProductsCell: UITableViewCell {

    @IBOutlet weak var imageProduct: UIImageView!
    @IBOutlet weak var lbNameProduct: UILabel!
    @IBOutlet weak var btnSize: UIButton!
    @IBOutlet weak var viewAmount: UIView!
    @IBOutlet weak var btnMinus: UIButton!
    @IBOutlet weak var btnPlus: UIButton!
    @IBOutlet weak var lbAmount: UILabel!
    @IBOutlet weak var lbPrice: UILabel!
    
    var didClickSize:((_ sender:UIButton)->Void)! = nil
    var didClickMinus:((_ amount:Int)->Void)! = nil
    var didClickPlus:((_ amount:Int)->Void)! = nil
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func clickSize(_ sender: UIButton) {
        if didClickSize != nil{
            didClickSize(sender)
        }
    }
    @IBAction func clickMinus(_ sender: UIButton) {
        let amount = Int(lbAmount.text!)! - 1
        if didClickMinus != nil {
            didClickMinus(amount)
        }
    }
    
    @IBAction func clickPlus(_ sender: UIButton) {
        let amount = Int(lbAmount.text!)! + 1
        if didClickPlus != nil {
            didClickPlus(amount)
        }
    }
    
    
    

}
