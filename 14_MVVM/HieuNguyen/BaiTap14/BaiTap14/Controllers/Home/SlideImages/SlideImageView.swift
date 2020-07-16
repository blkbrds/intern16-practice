//
//  SlideImageView.swift
//  BaiTap14
//
//  Created by PCI0020 on 7/16/20.
//  Copyright © 2020 hieu.ngq. All rights reserved.
//

import UIKit

class SlideImageView: UIView {

    @IBOutlet weak var imageCollectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    let slideImageViewModel = SlideImageViewModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "imageCell")
        imageCollectionView.delegate = self
        imageCollectionView.dataSource = self
        imageCollectionView.isScrollEnabled = false
        pageControl.numberOfPages = slideImageViewModel.images.count
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @IBAction func previousButtonTouchUpInside(_ sender: Any) {
        let visibleItems: NSArray = self.imageCollectionView.indexPathsForVisibleItems as NSArray
        let currentItem: IndexPath = visibleItems.object(at: 0) as! IndexPath
        let nextItem: IndexPath = IndexPath(item: currentItem.item - 1, section: 0)
        if nextItem.row < slideImageViewModel.images.count && nextItem.row >= 0{
            self.imageCollectionView.scrollToItem(at: nextItem, at: .centeredHorizontally, animated: true)
            self.pageControl.currentPage = currentItem.item - 1
        }
    }
    
    @IBAction func nextButtonTouchUpInside(_ sender: Any) {
        let visibleItems: NSArray = self.imageCollectionView.indexPathsForVisibleItems as NSArray
        let currentItem: IndexPath = visibleItems.object(at: 0) as! IndexPath
        let nextItem: IndexPath = IndexPath(item: currentItem.item + 1, section: 0)
        if nextItem.row < slideImageViewModel.images.count {
            self.imageCollectionView.scrollToItem(at: nextItem, at: .centeredHorizontally, animated: true)
            self.pageControl.currentPage = currentItem.item + 1
        }
    }
}

extension SlideImageView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slideImageViewModel.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath)
        cell.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        
        let image = UIImageView()
        image.frame = cell.bounds
        image.image = slideImageViewModel.images[indexPath.row].image
        image.contentMode = .scaleToFill
        cell.addSubview(image)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 16, height: self.imageCollectionView.frame.height - 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
}
