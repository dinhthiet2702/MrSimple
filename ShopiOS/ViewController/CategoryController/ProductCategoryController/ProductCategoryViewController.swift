//
//  ProductCategoryViewController.swift
//  ShopiOS
//
//  Created by thiet on 4/29/20.
//  Copyright © 2020 Ân Lê. All rights reserved.
//

import UIKit

class ProductCategoryViewController: UIViewController,FilterDelegate {
    func finishFilter(filter: String) {
        text = filter
    }
    
   
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnSort: UIButton!
    @IBOutlet var btnSortHide: [UIButton]!
    var text:String = ""
    var titleNav:String!
    override func viewDidLoad() {
        super.viewDidLoad()
        customBackNav(nameImg: "back")
        self.navigationItem.title = titleNav
        tableView.delegate = self
        tableView.dataSource = self
        
        
        
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? CateGoryFilterViewController {
            destination.delegate = self
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        
        print(text)
    }
    
    @IBAction func clickSort(_ sender: UIButton) {
        
        self.btnSortHide.forEach { (button) in
            UIView.animate(withDuration: 0.25) {
                button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            }
        }
    }
    @IBAction func newProductClick(_ sender: UIButton) {
        self.btnSort.setTitle(sender.titleLabel?.text, for: UIControl.State.normal)
        
        self.btnSortHide.forEach { (button) in
            UIView.animate(withDuration: 0.25) {
                button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            }
        }
    }
    
    @IBAction func priceShortToHight(_ sender: UIButton) {
        self.btnSort.setTitle(sender.titleLabel?.text, for: UIControl.State.normal)
        
        self.btnSortHide.forEach { (button) in
            UIView.animate(withDuration: 0.25) {
                button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            }
        }
    }
    @IBAction func priceHightToShort(_ sender: UIButton) {
        self.btnSort.setTitle(sender.titleLabel?.text, for: UIControl.State.normal)
        
        self.btnSortHide.forEach { (button) in
            UIView.animate(withDuration: 0.25) {
                button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            }
        }
    }
    @IBAction func allProduct(_ sender: UIButton) {
        self.btnSort.setTitle(sender.titleLabel?.text, for: UIControl.State.normal)
        
        self.btnSortHide.forEach { (button) in
            UIView.animate(withDuration: 0.25) {
                button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            }
        }
    }
    @IBAction func clickSale(_ sender: UIButton) {
        self.btnSort.setTitle(sender.titleLabel?.text, for: UIControl.State.normal)
        
        self.btnSortHide.forEach { (button) in
            UIView.animate(withDuration: 0.25) {
                button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            }
        }
    }
    
    
    

}
extension ProductCategoryViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCateGoryCell", for: indexPath) as! ProductCateGoryCell
        
        cell.collectionView.delegate = cell
        cell.collectionView.dataSource = cell
        cell.heightContent.constant = cell.collectionView.collectionViewLayout.collectionViewContentSize.height
        cell.collectionView.layoutIfNeeded()
        cell.collectionView.reloadData()
        cell.pushView = {
            let DetailsProductVC = sb.instantiateViewController(withIdentifier: "DetailProductViewController") as! DetailProductViewController
            self.navigationController?.pushViewController(DetailsProductVC, animated: true)
            
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
