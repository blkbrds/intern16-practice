//
//  HomeViewController.swift
//  CollectionView
//
//  Created by Abcd on 8/4/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
        // MARK: - Properties
        private var datas: [Int] = Array(0...25)
        private var heights: [CGFloat] = []
        
        // MARK: - Override
        override func viewDidLoad() {
            super.viewDidLoad()
            let nib = UINib(nibName: "HomeCollectionViewCell", bundle: Bundle.main)
            collectionView.register(nib, forCellWithReuseIdentifier: "cell")
            collectionView.dataSource = self
            if let layout = collectionView?.collectionViewLayout as? PinterestLayout {
                layout.delegate = self
                randomHeight()
            }
        }
        
        // MARK: - Function
        private func randomHeight() {
            for _ in 0 ..< datas.count {
                heights.append(CGFloat.random(in: 30...200))
            }
        }
    }

    // MARK: - UICollectionViewDataSource
    extension HomeViewController: UICollectionViewDataSource {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return datas.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeCollectionViewCell
            return cell
        }
    }

    // MARK: - PinterestLayoutDelegate
    extension HomeViewController:  PinterestLayoutDelegate {
        func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
            return heights[indexPath.item]
        }
    }
