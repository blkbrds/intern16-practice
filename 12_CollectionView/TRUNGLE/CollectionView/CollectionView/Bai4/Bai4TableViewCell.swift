//
//  Bai4TableViewCell.swift
//  CollectionView
//
//  Created by Abcd on 8/7/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import UIKit

class Bai4TableViewCell: UITableViewCell {
    //MARK: - IBOutlet
    @IBOutlet weak var collectionViewTag: UICollectionView!
     // MARK: - Properties
        var dataTags: [Int] = []
        
        // MARK: - Override
        override func awakeFromNib() {
            super.awakeFromNib()
            let nib = UINib(nibName: "bai4HomeCell", bundle: Bundle.main)
            collectionViewTag.register(nib, forCellWithReuseIdentifier: "bai4HomeCell")
            collectionViewTag.dataSource = self
            collectionViewTag.delegate = self
        }
        
        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
        }
        
    }

    // MARK: - UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
    extension Bai4TableViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            dataTags.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionViewTag.dequeueReusableCell(withReuseIdentifier: "bai4HomeCell", for: indexPath) as! bai4HomeCell
            cell.cellButton.setTitle(String(dataTags[indexPath.row]), for: .normal)
            return cell
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 100, height: 100)
        }
    }
