//
//  ShopCartPusscharCell.swift
//  ShopiOS
//
//  Created by thiet on 5/9/20.
//  Copyright © 2020 Ân Lê. All rights reserved.
//

import UIKit

class PayProductsPussCharCell: UITableViewCell {
    @IBOutlet weak var btnKindPusschar: UIButton!
    @IBOutlet var viewPussChar: [UIView]!
    @IBOutlet weak var viewLinePussChar: UIView!
    @IBOutlet weak var lbBanking: UILabel!
    @IBOutlet weak var btnCheckBanking: UIButton!
    @IBOutlet weak var lbATM: UILabel!
    @IBOutlet weak var btnCheckATM: UIButton!
    @IBOutlet weak var lbCOD: UILabel!
    @IBOutlet weak var btnCheckCOD: UIButton!
    @IBOutlet weak var tfVocher: UITextField!
    @IBOutlet weak var btnAcceptVoCher: UIButton!
    @IBOutlet weak var lbCustomer: UILabel!
    @IBOutlet weak var btnAddCustomer: UIButton!
    @IBOutlet weak var lbTienKhuyenMai: UILabel!
    @IBOutlet weak var lbTotalCart: UILabel!
    @IBOutlet weak var btnThanhToan: UIButton!
    @IBOutlet weak var lbMasterCard: UILabel!
    @IBOutlet weak var btnMasterCar: UIButton!
    
    
    var didClickKindPussChar:(()->Void)! = nil
    var didClickBanking:((_ sender:UIButton)->Void)! = nil
    var didClickATM:((_ sender:UIButton)->Void)! = nil
    var didClickMasterCard:((_ sender:UIButton)->Void)! = nil
    var didclickCOD:((_ sender:UIButton)->Void)! = nil
    var didclickPayBill:((_ sender:UIButton)->Void)! = nil
    var didClickAddCustomer:(()-> Void)! = nil
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func clickAceptVoucher(_ sender: UIButton) {
        
    }
    @IBAction func clickAddCustomer(_ sender: UIButton) {
        if didClickAddCustomer != nil{
            didClickAddCustomer()
        }
    }
    
    
    @IBAction func clickKindPussChar(_ sender: UIButton) {
        if didClickKindPussChar != nil{
            didClickKindPussChar()
        }
    }
    @IBAction func clickBanking(_ sender: UIButton) {
        if didClickBanking != nil{
            didClickBanking(btnCheckBanking)
        }
    }
    @IBAction func clickATM(_ sender: UIButton) {
        if didClickATM != nil{
            didClickATM(btnCheckATM)
        }
    }
    @IBAction func clickMasterCard(_ sender: UIButton) {
        if didClickMasterCard != nil{
            didClickMasterCard(btnMasterCar)
        }
    }
    @IBAction func clickCOD(_ sender: UIButton) {
        if didclickCOD != nil{
            didclickCOD(btnCheckCOD)
        }
    }
    
    
    
    
    
    
    @IBAction func clickPayBill(_ sender: UIButton) {
    }
    
    
    

}
