//
//  ButtonBackNav.swift
//  ShopiOS
//
//  Created by thiet on 4/21/20.
//  Copyright © 2020 Ân Lê. All rights reserved.
//

import Foundation
import UIKit
import ActionSheetPicker_3_0

extension UIViewController{
    func customBackNav(nameImg:String){
        let leftBtn = UIBarButtonItem(image: UIImage(named: nameImg)?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal), style: .plain, target: self, action: #selector(back))
        
        navigationItem.leftBarButtonItem = leftBtn
    }
    @objc func back(){
        self.navigationController?.popViewController(animated: true)
    }
    
}
extension UIButton{
    func showPickerSetData(title:String,arrString:[String] ){
        ActionSheetStringPicker.show(withTitle: title,
        rows: arrString,
        initialSelection: 0,
        doneBlock: { picker, value, index in
            self.setTitle(String(describing: index!), for: .normal)
           return
        },
        cancel: { picker in
           return
        },
        origin: self)
        
    }
}
