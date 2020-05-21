//
//  ShopCartViewController.swift
//  ShopiOS
//
//  Created by thiet on 4/12/20.
//  Copyright © 2020 Ân Lê. All rights reserved.
//

import UIKit

class PayProductsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Thanh Toán"
        tableView.delegate = self
        tableView.dataSource = self
        customBackNav(nameImg: "back")
        
        // Do any additional setup after loading the view.
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
extension PayProductsViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return 1
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "PayProductsCell", for: indexPath) as! PayProductsCell
            //coding
            cell.didClickViewToCart = {
                self.navigationController?.popViewController(animated: true)
            }
            //khoi tao collectionView
            cell.collectionView.delegate = cell
            cell.collectionView.dataSource = cell
            cell.collectionView.reloadData()
            
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "PayProductsPussCharCell", for: indexPath) as! PayProductsPussCharCell
            //coding
            cell.btnAcceptVoCher.layer.cornerRadius = 5
            cell.btnThanhToan.layer.cornerRadius = 7
            cell.btnAddCustomer.layer.cornerRadius = 7
            cell.didClickAddCustomer = {
                let InfoCustomerVC = sb.instantiateViewController(withIdentifier: "InfoCustomerViewController") as! InfoCustomerViewController
                
                self.navigationController?.pushViewController(InfoCustomerVC, animated: true)
            }
            cell.didClickKindPussChar = {
                cell.viewPussChar.forEach { (view) in
                    UIView.animate(withDuration: 0.15) {
                        view.isHidden = !view.isHidden
                        if view.isHidden == true {
                            cell.viewLinePussChar.alpha = 0
                        }
                        else{
                            cell.viewLinePussChar.alpha = 1
                        }
                    }
                }
                cell.layoutIfNeeded()
                self.tableView.reloadData()
            }
            cell.didClickBanking = { (sender) in           
                sender.isSelected = true
                cell.btnCheckATM.isSelected = false
                cell.btnMasterCar.isSelected = false
                cell.btnCheckCOD.isSelected = false
            }
            cell.didClickATM = { (sender) in
                sender.isSelected = true
                cell.btnCheckBanking.isSelected = false
                cell.btnMasterCar.isSelected = false
                cell.btnCheckCOD.isSelected = false
            }
            cell.didClickMasterCard = { (sender) in
                sender.isSelected = true
                cell.btnCheckBanking.isSelected = false
                cell.btnCheckATM.isSelected = false
                cell.btnCheckCOD.isSelected = false
                
            }
            cell.didclickCOD = { (sender) in
                sender.isSelected = true
                cell.btnCheckBanking.isSelected = false
                cell.btnMasterCar.isSelected = false
                cell.btnCheckATM.isSelected = false
            }
            
            return cell
        }
         
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return self.view.frame.height * 0.367
        default:
            return UITableView.automaticDimension
        }
    }
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        tableView.keyboardDismissMode = .onDrag
    }
}
