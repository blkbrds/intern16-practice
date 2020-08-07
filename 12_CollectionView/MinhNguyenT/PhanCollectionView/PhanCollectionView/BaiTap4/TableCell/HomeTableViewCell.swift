//
//  HomeTableViewCell.swift
//  PhanCollectionView
//
//  Created by MacBook Pro on 8/7/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class HomeTableViewCell: UITableViewCell {

    // MARK: - @IBOutlets
    @IBOutlet private weak var collectionView: UICollectionView!

    // MARK: - Peroperties
    private var datas: [Data] = []

    // MARK: - Override functions
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    // MARK: - Public functions
    public func updateCollectionCell(datas: [Data]) {
        self.datas = datas
        collectionView.reloadData()
    }

    public func configCollectionCell() {
        let nib = UINib(nibName: "HomeCollectionViewCell", bundle: .main)
        collectionView.register(nib, forCellWithReuseIdentifier: "HomeCollectionViewCell")
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension HomeTableViewCell: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datas.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        cell.updateCollectionCell(data: datas[indexPath.row])
        return cell
    }
}

extension HomeTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 200)
    }
}

