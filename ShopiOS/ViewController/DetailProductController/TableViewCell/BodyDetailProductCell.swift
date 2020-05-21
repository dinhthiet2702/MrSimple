//
//  BodyDetailProductCell.swift
//  ShopiOS
//
//  Created by thiet on 5/8/20.
//  Copyright © 2020 Ân Lê. All rights reserved.
//

import UIKit

class BodyDetailProductCell: UITableViewCell {
    @IBOutlet weak var lbPriceProductDetail: UILabel!
    @IBOutlet weak var lbContentProductDetail: UILabel!
    @IBOutlet weak var lbDetailProduct: UILabel!
    
    var didClickColor:((_ sender:UIButton)->Void)! = nil
    var didClickSize:((_ sender:UIButton)->Void)! = nil
    var didClickAddProToCart:(()->Void)! = nil
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func lickColorProductDetail(_ sender: UIButton) {
        if didClickColor != nil{
            didClickColor(sender)
        }
    }
    @IBAction func clickSizeProductDetail(_ sender: UIButton) {
        if didClickSize != nil{
            didClickSize(sender)
        }
    }
    @IBAction func clickAddProductToCart(_ sender: UIButton) {
        if didClickAddProToCart != nil{
            didClickAddProToCart()
        }
    }
    
}
