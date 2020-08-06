//
//  CustomTableViewCell.swift
//  BaiTapCollectionView
//
//  Created by NganHa on 8/5/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

final class CustomTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var collectionView: UICollectionView!

    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
         configCollectionView()
    }
    
    // MARK: - Override functions
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
       
    }
    
    // MARK: - Private functions
    private func configCollectionView() {
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "reusableCell")
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension CustomTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reusableCell", for: indexPath)
        cell.backgroundColor = UIColor(red: CGFloat(Float.random(in: 0...1)), green: CGFloat(Float.random(in: 0...1)), blue: CGFloat(Float.random(in: 0...1)), alpha: 1)
        return cell
    }
}

extension CustomTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width / 5 - 10
        return CGSize(width: width, height: width)
    }
}
