//
//  ShopCartProductsCell.swift
//  ShopiOS
//
//  Created by thiet on 5/9/20.
//  Copyright © 2020 Ân Lê. All rights reserved.
//

import UIKit

class PayProductsCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var lbPriceCart: UILabel!
    
    var didClickViewToCart:(()->Void)! = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func clickViewToCart(_ sender: UIButton) {
        if didClickViewToCart != nil{
            didClickViewToCart()
        }
    }
    
    
}
extension PayProductsCell : UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PayProductsCellList", for: indexPath) as! PayProductsCellList
        
        return cell
    }
    
    
}
extension PayProductsCell: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.contentView.frame.width * 0.27
        let height = self.contentView.frame.height * 0.58
        let size:CGSize = CGSize(width: width, height: height)
        return size
    }
}
