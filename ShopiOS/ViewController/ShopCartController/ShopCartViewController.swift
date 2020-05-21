//
//  ShopCartViewController.swift
//  ShopiOS
//
//  Created by thiet on 5/12/20.
//  Copyright © 2020 Ân Lê. All rights reserved.
//

import UIKit

class ShopCartViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var viewPayBottom: UIView!
    @IBOutlet weak var lbTotalProduct: UILabel!
    @IBOutlet weak var lbTotalPrice: UILabel!
    @IBOutlet weak var btnPayProduct: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Giỏ hàng"
        btnPayProduct.layer.cornerRadius = 5
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    @IBAction func clickPayProduct(_ sender: UIButton) {
        let PayProductVC = sb.instantiateViewController(withIdentifier: "PayProductsViewController") as! PayProductsViewController
        
        
        
        self.navigationController?.pushViewController(PayProductVC, animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension ShopCartViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShopCartProductsCell", for: indexPath) as! ShopCartProductsCell
        let radiusValue = cell.btnPlus.frame.width / 2
        cell.btnPlus.layer.cornerRadius = radiusValue
        cell.btnMinus.layer.cornerRadius = radiusValue
        cell.didClickSize = { (sender) in
            sender.showPickerSetData(title: "Chọn size", arrString: ["X","L"])
        }
        cell.didClickMinus = { (amount) in
            if amount < 0 {
                cell.lbAmount.text = String("0")
            }
            else{
                cell.lbAmount.text = String(amount)
            }
            
            
        }
        cell.didClickPlus = { (amount) in
            cell.lbAmount.text = String(amount)
                   
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
}
