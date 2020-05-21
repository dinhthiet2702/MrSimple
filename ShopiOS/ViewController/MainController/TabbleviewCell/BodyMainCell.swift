//
//  BodyMainCell.swift
//  ShopiOS
//
//  Created by thiet on 4/14/20.
//  Copyright © 2020 Ân Lê. All rights reserved.
//

import UIKit

class BodyMainCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var heighCollectionView: NSLayoutConstraint!
    var imageBody:[UIImage]!
    override func awakeFromNib() {
        super.awakeFromNib()
       
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
extension BodyMainCell:UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageBody.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BodyMainCellList", for: indexPath) as! BodyMainCellList
        cell.imgBodyItems.image = imageBody[indexPath.item]
        cell.layer.cornerRadius = 10
        cell.clipsToBounds = true
        return cell
    }
}
extension BodyMainCell:UICollectionViewDelegateFlowLayout{
    
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let currentImage = imageBody[indexPath.item]
            let imageCrop = currentImage.getCropRatio()
            let heigtItem = collectionView.frame.width / imageCrop
            let width = self.contentView.frame.size.width * 0.95
            return CGSize(width: width, height: heigtItem)
        }
}
extension UIImage{
    
    func getCropRatio()->CGFloat{
        let wRatio = CGFloat(self.size.width / self.size.height)
        return wRatio
    }
}
