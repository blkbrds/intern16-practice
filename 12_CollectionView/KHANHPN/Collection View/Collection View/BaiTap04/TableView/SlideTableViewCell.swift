//
//  SlideTableViewCell.swift
//  Collection View
//
//  Created by Ngoc Khanh Phan on 8/18/20.
//  Copyright © 2020 Phan Ngọc Khánh. All rights reserved.
//

import UIKit

final class SlideTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    let images: [UIImage] = [#imageLiteral(resourceName: "wp1"), #imageLiteral(resourceName: "wp2"), #imageLiteral(resourceName: "wp3")]
    
    // MARK: - Private IBOutlet
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - Liffe cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Override function
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Private function
    private func setupFlowLayout() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        flowLayout.minimumLineSpacing = 2.0
        flowLayout.minimumInteritemSpacing = 5.0
        self.collectionView.collectionViewLayout = flowLayout
        self.collectionView.showsHorizontalScrollIndicator = false
        let headerCellNib = UINib(nibName: "HeaderCollectionViewCell", bundle: nil)
        collectionView.register(headerCellNib, forCellWithReuseIdentifier: "headerID")
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

// MARK: - Extension
extension SlideTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "headerID", for: indexPath) as? HeaderCollectionViewCell {
            cell.headerImageView.image = images[indexPath.row]
            return cell
        }
        return UICollectionViewCell()
    }
}
