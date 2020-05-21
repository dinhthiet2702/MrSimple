//
//  BaseTabbarController.swift
//  ShopiOS
//
//  Created by thiet on 4/11/20.
//  Copyright © 2020 Ân Lê. All rights reserved.
//

import UIKit
import AMScrollingNavbar
class BaseTabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabbar()
        
        // Do any additional setup after loading the view.
    }
    func setUpTabbar() {
        let MainVc = sb.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        MainVc.tabBarItem = UITabBarItem(title: "Trang chủ", image: UIImage(named: "home")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal), selectedImage: UIImage(named: "home-selected")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal))
        let navMain = ScrollingNavigationController(rootViewController: MainVc)
        
        
        let PlanVc = sb.instantiateViewController(withIdentifier: "CategoryViewController") as! CategoryViewController
        PlanVc.tabBarItem = UITabBarItem(title: "Danh mục", image: UIImage(named: "category")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal), selectedImage: UIImage(named: "category-selected")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal))
        let navPlan = ScrollingNavigationController(rootViewController: PlanVc)
        
        
        let ShopCartVc = sb.instantiateViewController(withIdentifier: "ShopCartViewController") as! ShopCartViewController
        ShopCartVc.tabBarItem = UITabBarItem(title: "Giỏ hàng", image: UIImage(named: "cart")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal), selectedImage: UIImage(named: "cart-selected")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal))
        let navShopCart = ScrollingNavigationController(rootViewController: ShopCartVc)
        
        
        let ProfileVc = sb.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        ProfileVc.tabBarItem = UITabBarItem(title: "Cá nhân", image: UIImage(named: "profile")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal), selectedImage: UIImage(named: "profile-selected")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal))
        let navProfile = ScrollingNavigationController(rootViewController: ProfileVc)
        
        
        
        self.viewControllers = [navMain,navPlan,navShopCart,navProfile]
        
        // CHữ title không bị đen
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .selected)
    }

}
