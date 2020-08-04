//
//  BaiTap2ViewController.swift
//  BaiTapCollectionView
//
//  Created by NganHa on 8/4/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

final class BaiTap2ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - Propeties
    
    // MARK: - Initialize
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configCollectionView()
        if let layout = collectionView?.collectionViewLayout as? SquareCollectionViewLayout {
          layout.delegate = self
        }
    }
    // MARK: - Override functions
    
    // MARK: - Private functions
    private func configCollectionView() {
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "reusableCell")
        collectionView.dataSource = self
    }
    // MARK: - Public functions
    
    // MARK: - Objc functions
    
    // MARK: - IBActions
}

// MARK: - UICollectionViewDataSource
extension BaiTap2ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reusableCell", for: indexPath)
        cell.backgroundColor = .systemPink
        return cell
    }
}

extension BaiTap2ViewController: SquareCollectionViewLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, heightForIndexPath indexPath: IndexPath) -> CGFloat {
        return CGFloat(Float.random(in: Float(indexPath.item)...200))
    }
}
