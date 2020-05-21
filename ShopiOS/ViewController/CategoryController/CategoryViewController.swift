//
//  PlainViewController.swift
//  ShopiOS
//
//  Created by thiet on 4/12/20.
//  Copyright © 2020 Ân Lê. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var searchBar:UISearchBar = UISearchBar()
    var searchTitle:UIBarButtonItem!
    
    var Categories:[String] = ["Sale 70%","New In","Polo","Jeans","Suits","Hoodie & Sweatshirts","Jacket"]
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        setupViewSearch()
    }
    private func setupViewSearch(){
        self.navigationController?.hideHairline()
        searchBar.frame = CGRect(x: 0, y: 0, width: self.view.frame.width - 20, height: 20)
        searchBar.searchBarStyle = .minimal
        searchBar.changeFont(textFont: "Judson-Regular", size: 17)
        searchBar.placeholder = "Tìm kiếm trên sản phẩm"
        searchTitle = UIBarButtonItem(customView: searchBar)
        self.navigationItem.leftBarButtonItem = searchTitle
    }

    
}
extension CategoryViewController: UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate{
//    func numberOfSections(in tableView: UITableView) -> Int {
//
//    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Categories.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
        cell.viewCategory.layer.cornerRadius = 5
        cell.lbCateGory.text = Categories[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.height / 5
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let ProCateGoryVC = sb.instantiateViewController(withIdentifier: "ProductCategoryViewController") as! ProductCategoryViewController
        ProCateGoryVC.titleNav = Categories[indexPath.row]
        self.navigationController?.pushViewController(ProCateGoryVC, animated: true)
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let ofset = scrollView.contentOffset.y
        let titleView = UILabel()
        titleView.text = "Danh mục sản phẩm"
        titleView.font = UIFont(name: "Judson-Regular", size: 17)
        titleView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width - 20, height: 20)
        titleView.textAlignment = .center
        let titleCategory = UIBarButtonItem(customView: titleView)
        if ofset < 44 {
            self.navigationItem.leftBarButtonItem = self.searchTitle
        }
        else{
            self.navigationItem.leftBarButtonItem = titleCategory
        }
    }
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        searchBar.resignFirstResponder()
    }
}
