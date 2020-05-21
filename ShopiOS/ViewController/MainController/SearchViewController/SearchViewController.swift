//
//  SearchViewController.swift
//  ShopiOS
//
//  Created by thiet on 4/20/20.
//  Copyright © 2020 Ân Lê. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    var searchBar:UISearchBar = UISearchBar()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        setupViewSearch()
    }
  
    private func setupViewSearch(){
        searchBar.frame = CGRect(x: 0, y: 0, width: self.view.frame.width - 65, height: 20)
        searchBar.becomeFirstResponder()
        searchBar.searchBarStyle = .minimal
        searchBar.changeFont(textFont: "Judson-Regular", size: 17)
        searchBar.placeholder = "Tìm kiếm trên MR SIMPLE"
        customBackNav(nameImg: "back")
        let searchTitle  = UIBarButtonItem(customView: searchBar)
        self.navigationItem.rightBarButtonItem = searchTitle
    }
}
extension SearchViewController:UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath) as! SearchCell
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        searchBar.resignFirstResponder()
    }
    
}
