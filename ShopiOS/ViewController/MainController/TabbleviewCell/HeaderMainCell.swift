//
//  HeaderMainCell.swift
//  ShopiOS
//
//  Created by thiet on 4/12/20.
//  Copyright © 2020 Ân Lê. All rights reserved.
//

import UIKit

class HeaderMainCell: UITableViewCell {
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension HeaderMainCell:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeaderMainCellList", for: indexPath) as! HeaderMainCellList
        cell.viewNewFeed.layer.cornerRadius = cell.viewNewFeed.frame.width / 2
        cell.viewNewFeed.clipsToBounds = true
        cell.viewNewFeed.layer.borderWidth = 3
        cell.viewNewFeed.layer.borderColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        cell.imgNewFeed.image = UIImage(named: "abc")
        cell.imgNewFeed.layer.cornerRadius = cell.imgNewFeed.frame.width / 2
        cell.imgNewFeed.clipsToBounds = true
        
        cell.imgHot.image = UIImage(named: "new")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.reloadItems(at: [indexPath])
        let cell = collectionView.cellForItem(at: indexPath) as! HeaderMainCellList
        cell.viewNewFeed.layer.borderWidth = 3
        cell.viewNewFeed.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    }
    
    

}
