//
//  DetailProductCell.swift
//  ShopiOS
//
//  Created by thiet on 5/7/20.
//  Copyright © 2020 Ân Lê. All rights reserved.
//

import UIKit

class DetailProductImageCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @objc func scrollToNextCell(){
        //get cell size
        let cellSize = CGSize(width: contentView.frame.width, height: contentView.frame.height)

        //get current content Offset of the Collection view
        let contentOffset = collectionView.contentOffset
        //scroll to next cell
        collectionView.scrollRectToVisible(CGRect(x: contentOffset.x + cellSize.width, y: contentOffset.y, width: cellSize.width, height: cellSize.height), animated: true)
        if collectionView.contentSize.width <= collectionView.contentOffset.x + contentView.frame.width {
            collectionView.scrollRectToVisible(CGRect(x: 0, y: 0, width: cellSize.width, height: cellSize.height), animated: true)
        }


    }

    /**
     Invokes Timer to start Automatic Animation with repeat enabled
     */
    func startTimer() {
        Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(scrollToNextCell), userInfo: nil, repeats: true);
    }
}
extension DetailProductImageCell:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailProductImageCellList", for: indexPath) as! DetailProductImageCellList
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.contentView.frame.width
        let height = self.contentView.frame.height
        let size:CGSize = CGSize(width: width, height: height)
        
        return size
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {

        pageControl?.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }

    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {

        pageControl?.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
    
}
