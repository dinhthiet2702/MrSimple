//
//  ProfileViewController.swift
//  ShopiOS
//
//  Created by thiet on 4/12/20.
//  Copyright © 2020 Ân Lê. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let MenuList:[String] = ["Đơn hàng của tôi","Thông tin cá nhân","Mã giảm giá","Cửa hàng","Liên hệ","Đăng xuất"]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        navigationItem.title = "Cá nhân"
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
extension ProfileViewController:UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return MenuList.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "InfoPersonCell", for: indexPath) as! InfoPersonCell
            cell.btnImgPerson.layer.cornerRadius = cell.btnImgPerson.frame.width / 2
            cell.btnImgPerson.clipsToBounds = true
            cell.btnImgPerson.layer.borderWidth = 0.5
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "MenuListCell", for: indexPath) as! MenuListCell
            cell.lbTitleMenu.text = MenuList[indexPath.row]
            return cell
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 235
        default:
            return 50
        }
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            print("\(indexPath.row)")
        default:
            print("\(indexPath.row)")
        }
    }
}
