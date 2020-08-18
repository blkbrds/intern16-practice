//
//  BaiTap02ViewController.swift
//  Collection View
//
//  Created by Phan Ngọc Khánh on 8/10/20.
//  Copyright © 2020 Phan Ngọc Khánh. All rights reserved.
//

import UIKit

final class BaiTap02ViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configCollectionView()
        if let layout = collectionView?.collectionViewLayout as? SquareCollectionViewLayout {
            layout.delegate = self
        }
    }
    
    // MARK: - Private functions
    fileprivate func configCollectionView() {
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "reusableCell")
        collectionView.dataSource = self
    }
}

// MARK: - Extensions
extension BaiTap02ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reusableCell", for: indexPath)
        cell.backgroundColor = .systemTeal
        return cell
    }
}

extension BaiTap02ViewController: SquareCollectionViewLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, heightForIndexPath indexPath: IndexPath) -> CGFloat {
        return CGFloat(Float.random(in: Float(indexPath.item)...200))
    }
}
