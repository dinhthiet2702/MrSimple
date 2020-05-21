//
//  DetailProductViewController.swift
//  ShopiOS
//
//  Created by thiet on 5/7/20.
//  Copyright © 2020 Ân Lê. All rights reserved.
//

import UIKit

class DetailProductViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let sizesPro:[String] = ["XL","M","S"]
    let colorsPro:[String] = ["Xanh", "Đỏ", "Đen"]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        transparentBarNav()
        customBackNav(nameImg: "back_white")
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
extension DetailProductViewController:UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailProductImageCell", for: indexPath) as! DetailProductImageCell
            //pass data
            
            //khoi tao collectionview
            cell.collectionView.delegate = cell
            cell.collectionView.dataSource = cell
            cell.startTimer()
            cell.collectionView.reloadData()
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "BodyDetailProductCell", for: indexPath) as! BodyDetailProductCell
            //pass data
            cell.didClickColor = { (sender) in
                sender.showPickerSetData(title: "Chọn màu", arrString: self.colorsPro)
            }
            cell.didClickSize = { (sender) in
                sender.showPickerSetData(title: "Chọn size", arrString: self.sizesPro)
                
            }
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "AlikeProductDetailCell", for: indexPath) as! AlikeProductDetailCell
            //pass data
            
            //khoi tao collectionview
            cell.collectionView.delegate = cell
            cell.collectionView.dataSource = cell
            cell.collectionView.reloadData()
            return cell
            
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return self.view.frame.height * 0.79
        case 1:
            return self.view.frame.height * 0.5
        default:
            return self.view.frame.height * 0.48
        }
        
    }
    
}
