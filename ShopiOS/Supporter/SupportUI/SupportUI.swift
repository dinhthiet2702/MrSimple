//
//  SupportUI.swift
//  ShopiOS
//
//  Created by thiet on 4/11/20.
//  Copyright © 2020 Ân Lê. All rights reserved.
//

import Foundation
import UIKit

let sb:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)

extension UIViewController{
    func transparentBarNav() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
}
extension UINavigationController {
    /// ẩn đường kẻ tóc dưới thanh navigation
    func hideHairline() {
        if let hairline = findHairlineImageViewUnder(navigationBar) {
            hairline.isHidden = true
        }
    }
    /// hiện đường kẻ tóc dưới thanh navigation
    func restoreHairline() {
        if let hairline = findHairlineImageViewUnder(navigationBar) {
            hairline.isHidden = false
        }
    }
    func findHairlineImageViewUnder(_ view: UIView) -> UIImageView? {
        if view is UIImageView && view.bounds.size.height <= 1.0 {
            return view as? UIImageView
        }
        for subview in view.subviews {
            if let imageView = self.findHairlineImageViewUnder(subview) {
                return imageView
            }
        }
        return nil
    }
}
extension UISearchBar {
    func changeFont(textFont:String, size:CGFloat) {
        let textFieldInsideUISearchBar = self.value(forKey: "searchField") as? UITextField
        textFieldInsideUISearchBar?.font = UIFont(name: textFont, size: size)
        let labelInsideUISearchBar = textFieldInsideUISearchBar!.value(forKey: "placeholderLabel") as? UILabel
        labelInsideUISearchBar?.font = UIFont(name: textFont, size: size)
    }    
}
