//
//  AlikeProductDetailCell.swift
//  ShopiOS
//
//  Created by thiet on 5/8/20.
//  Copyright © 2020 Ân Lê. All rights reserved.
//

import UIKit

class AlikeProductDetailCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension AlikeProductDetailCell:UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AlikeProductDetailsCellList", for: indexPath) as! AlikeProductDetailsCellList
        
        return cell
    }
}
extension AlikeProductDetailCell:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.contentView.frame.width * 0.4
        let height = self.contentView.frame.height * 0.78
        let size:CGSize = CGSize(width: width, height: height)
        
        return size
    }
}
