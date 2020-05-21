//
//  CateGoryFilterViewController.swift
//  ShopiOS
//
//  Created by thiet on 5/2/20.
//  Copyright © 2020 Ân Lê. All rights reserved.
//

import UIKit
import MultiSlider


protocol FilterDelegate:class {
    func finishFilter(filter:String)
}
class CateGoryFilterViewController: UIViewController {
    
    @IBOutlet weak var btnGird: UIButton!
    @IBOutlet weak var btnHorizontal: UIButton!
    @IBOutlet weak var lbPriceFilter: UILabel!
    @IBOutlet weak var mutilSlider: MultiSlider!
    @IBOutlet weak var btnAcceptFilter: UIButton!
    @IBOutlet weak var btnKindProducts: UIButton!
    @IBOutlet weak var btnGenderProducts: UIButton!
    @IBOutlet weak var btnSizeProducts: UIButton!
    @IBOutlet weak var btnMaterialProducts: UIButton!
    weak var delegate:FilterDelegate?
    
    let kindProducts:[String] = ["Quần","Áo"]
    let genderProducts:[String] = ["Nam","Nữ"]
    let sizeProductsAo:[String] = ["XL","S","M","XXL"]
    let sizeProductsQuan:[String] = ["28","29","30","31"]
    let metalrial:[String] = ["coton 100%", "Nhựa", "Sắt"]
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        
        // Do any additional setup after loading the view.
    }
    
    func setUpView(){
        let titleView = UILabel()
        titleView.font = UIFont(name: "Judson-Regular", size: 20)
        titleView.text = "Bộ lọc"
        self.navigationItem.titleView = titleView
        customBackNav(nameImg: "close")
        btnAcceptFilter.layer.cornerRadius = 5
        mutilSlider.value = [0, 10000000]
        mutilSlider.addTarget(self, action: #selector(sliderChanged(_:)), for: .valueChanged)
    
    }
    @objc func sliderChanged(_ slider: MultiSlider) {
        let value = slider.value
        let change = Int(value[0]) / 100000 * 100000
        let change1 = Int(value[1]) / 100000 * 100000
        let formater = NumberFormatter()
        formater.groupingSeparator = "."
        formater.numberStyle = .decimal
        let priceChange0 = formater.string(from: NSNumber(value: change))!
        let priceChange1 = formater.string(from: NSNumber(value: change1))!
        lbPriceFilter.text = "Giá từ \(priceChange0) đ đến \(priceChange1) đ"
        
        
    }
    @IBAction func kindProducts(_ sender: UIButton) {
        sender.showPickerSetData(title: "Chọn loại", arrString: kindProducts)
        btnSizeProducts.setTitle("⌵", for: .normal)
    }
    @IBAction func forGender(_ sender: UIButton) {
        sender.showPickerSetData(title: "Dành cho", arrString: genderProducts)
    }
    @IBAction func sizeProducts(_ sender: UIButton) {
        if btnKindProducts.titleLabel?.text == "Quần"{
            sender.showPickerSetData(title: "Chọn size", arrString: sizeProductsQuan)
        }
        else{
            sender.showPickerSetData(title: "Chọn size", arrString: sizeProductsAo)
        }
    }
    @IBAction func materialProducts(_ sender: UIButton) {
         sender.showPickerSetData(title: "Chọn chất liệu", arrString: metalrial)
        
    }
    @IBAction func gird(_ sender: UIButton) {
        
        btnGird.isSelected = true
        btnHorizontal.isSelected = false
        
    }
    @IBAction func horizontal(_ sender: UIButton) {
        btnGird.isSelected = false
        btnHorizontal.isSelected = true
    }
    @IBAction func acceptFilter(_ sender: UIButton) {
        let text:String = "back ve nha"
        delegate?.finishFilter(filter: text)
        self.navigationController?.popViewController(animated: true)
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

