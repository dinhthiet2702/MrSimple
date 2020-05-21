//
//  TextFieldCustom.swift
//  ShopiOS
//
//  Created by thiet on 5/15/20.
//  Copyright © 2020 Ân Lê. All rights reserved.
//

import Foundation
import UIKit
extension UITextField{
    func borderBottomOnly(color : CGColor) {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: self.frame.height - 1, width: self.frame.width , height: 1)
        bottomLine.backgroundColor = color
        self.borderStyle = UITextField.BorderStyle.none
        self.layer.addSublayer(bottomLine)
    }
}
