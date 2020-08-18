//
//  BaiTap01ViewController.swift
//  Collection View
//
//  Created by Phan Ngọc Khánh on 8/10/20.
//  Copyright © 2020 Phan Ngọc Khánh. All rights reserved.
//

import UIKit

final class BaiTap01ViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    
    var data: [Model] = Model.getDummyDatas()
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    // MARK: - Private function
    
    fileprivate func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        let nib = UINib(nibName: "SquareCollectionViewCell", bundle: .main)
        collectionView.register(nib, forCellWithReuseIdentifier: "cell")
    }
}

// MARK: - Extension:

extension BaiTap01ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SquareCollectionViewCell
        let item = data[indexPath.row]
        cell.squareLabel.text = item.index
        return cell
    }
}
