//
//  ProductCateGoryCell.swift
//  ShopiOS
//
//  Created by thiet on 4/29/20.
//  Copyright © 2020 Ân Lê. All rights reserved.
//

import UIKit

class ProductCateGoryCell: UITableViewCell {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var heightContent: NSLayoutConstraint!
    var pushView:(()->Void)! = nil
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension ProductCateGoryCell:UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCateGoryCellList", for: indexPath) as! ProductCateGoryCellList
        cell.imgProduct.layer.borderWidth = 1
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if pushView != nil{
            pushView()
        }
    }
    
    
}
extension ProductCateGoryCell:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.contentView.frame.width * 0.42
        let height = width * 1.8
        let size = CGSize(width: width, height: height)
        return size
    }
}
