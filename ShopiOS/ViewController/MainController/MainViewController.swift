//
//  MainViewController.swift
//  ShopiOS
//
//  Created by thiet on 4/11/20.
//  Copyright © 2020 Ân Lê. All rights reserved.
//

import UIKit
import AMScrollingNavbar



class MainViewController: ScrollingNavigationViewController {
    var imageBody:[UIImage] = [#imageLiteral(resourceName: "test1"),#imageLiteral(resourceName: "mrsm3") ,#imageLiteral(resourceName: "mrsm1"), #imageLiteral(resourceName: "mrsp2")]
    @IBOutlet weak var tableView: UITableView!
    var logo:String!
    
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logo = "logo"
        createTilteMain()
        tableView.delegate = self
        tableView.dataSource = self
    }
    override func viewDidAppear(_ animated: Bool) {
      super.viewDidAppear(animated)

      if let navigationController = self.navigationController as? ScrollingNavigationController {
        navigationController.followScrollView(tableView, delay: 0.0)
        navigationController.shouldScrollWhenContentFits = true
        navigationController.scrollingNavbarDelegate = self
      }
    }
    override open func viewWillDisappear(_ animated: Bool) {
      super.viewWillDisappear(animated)
      
      if let navigationController = self.navigationController as? ScrollingNavigationController {
        navigationController.stopFollowingScrollView()
      }
    }
    func createTilteMain(){
        self.navigationController?.hideHairline()
        self.navigationController?.navigationBar.barTintColor = .white
        let leftNavBarButton = UIBarButtonItem(image: UIImage(named: logo)?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal), style: .plain, target: self, action: nil)
        leftNavBarButton.isEnabled = false
        self.navigationItem.leftBarButtonItem = leftNavBarButton
        
        
        let searchNavBarButton = UIBarButtonItem(image: UIImage(named: "search")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal), style: .plain, target: self, action: #selector(clickSearch))
        let messNavBarButton = UIBarButtonItem(image: UIImage(named: "messenger")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal), style: .plain, target: self, action: #selector(clickMess))
        self.navigationItem.rightBarButtonItems = [messNavBarButton,searchNavBarButton]
    }
    
    
    @objc func clickSearch(){
        let searchVC = sb.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
        UIView.animate(withDuration: 2, delay: 0.5, options: UIView.AnimationOptions(), animations: {
            self.navigationController?.pushViewController(searchVC, animated: true)
        }, completion: nil)
        
        
    }
    @objc func clickMess(){
        
        
        
    }
}




extension MainViewController:UITableViewDelegate,UITableViewDataSource{
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
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderMainCell", for: indexPath) as! HeaderMainCell
                cell.collectionView.reloadData()
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "BodyMainCell", for: indexPath) as! BodyMainCell
            cell.imageBody = self.imageBody
            cell.collectionView.dataSource = cell
            cell.collectionView.delegate = cell
            cell.heighCollectionView.constant = cell.collectionView.collectionViewLayout.collectionViewContentSize.height
            cell.collectionView.layoutIfNeeded()
            cell.collectionView.reloadData()
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "BottomMainCell", for: indexPath) as! BottomMainCell
                
            return cell
            
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 170
        case 1:
            return UITableView.automaticDimension
        default:
            return 150
        }
        
    }

    
}




extension MainViewController: ScrollingNavigationControllerDelegate {
  func scrollingNavigationController(_ controller: ScrollingNavigationController, willChangeState state: NavigationBarState) {
        view.needsUpdateConstraints()
  }
}
