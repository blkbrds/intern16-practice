//
//  Bai2ViewController.swift
//  BaitapCollectionView
//
//  Created by PCI0001 on 8/5/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

final class Bai2ViewController: UIViewController {
    
    // MARK: - IBOulets
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    private var datas: [Int] = Array(0...25)
    private var heights: [CGFloat] = []
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configCollectionView()
    }
    
    // MARK: - Private methods
    private func configCollectionView() {
        let nib = UINib(nibName: "CollectionViewCell", bundle: Bundle.main)
        collectionView.register(nib, forCellWithReuseIdentifier: "cell")
        collectionView.dataSource = self
        if let layout = collectionView?.collectionViewLayout as? PinterestLayout {
            layout.delegate = self
            randomHeight()
        }
    }
    
    private func randomHeight() {
        for _ in 0 ..< datas.count {
            heights.append(CGFloat.random(in: 30...200))
        }
    }
}

// MARK: - UICollectionViewDataSource
extension Bai2ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        return cell
    }
}

// MARK: - PinterestLayoutDelegate
extension Bai2ViewController:  PinterestLayoutDelegate {
    
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
        return heights[indexPath.item]
    }
}
