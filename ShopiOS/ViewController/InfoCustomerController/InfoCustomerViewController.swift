//
//  InfoCustomerViewController.swift
//  ShopiOS
//
//  Created by thiet on 5/15/20.
//  Copyright © 2020 Ân Lê. All rights reserved.
//

import UIKit

class InfoCustomerViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.navigationItem.title = "ĐỊA CHỈ KHÁCH HÀNG"
        
        customBackNav(nameImg: "back")
        // Do any additional setup after loading the view.
    }
    
}
extension InfoCustomerViewController:UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InfoCustomerCell", for: indexPath) as! InfoCustomerCell
        //coding
        cell.tfEmail.borderBottomOnly(color: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1))
        cell.tfFullName.borderBottomOnly(color: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1))
        cell.tfPhoneNumber.borderBottomOnly(color: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1))
        cell.tfCity.borderBottomOnly(color: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1))
        cell.tfAdress.borderBottomOnly(color: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1))
        cell.tfPhuongXa.borderBottomOnly(color: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1))
        cell.tfQuanHuyen.borderBottomOnly(color: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1))
        
            
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        tableView.keyboardDismissMode = .onDrag
    }
}
