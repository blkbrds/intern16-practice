//
//  Bai4TableViewCell.swift
//  BaitapCollectionView
//
//  Created by PCI0001 on 8/6/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

final class Bai4TableViewCell: UITableViewCell {
    
    // MARK: - IBOulets
    @IBOutlet private weak var collectonView: UICollectionView!
    
    // MARK: - Properties
    private var models = [Model]()
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        configCollectionView()
    }
    
    // MARK: - Private methods
    private func configCollectionView() {
        let nib = UINib(nibName: "Bai4CollectionViewCell", bundle: .main)
        collectonView.register(nib, forCellWithReuseIdentifier: "collectionCell")
        collectonView.dataSource = self
        collectonView.delegate = self
    }
    
    // MARK: - Public methods
    func updateTableView(with models: [Model]) {
        self.models = models
        collectonView.reloadData()
    }
}

// MARK: - Extension UICollectionViewDataSource, UICollectionDelegate
extension Bai4TableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! Bai4CollectionViewCell
        cell.updateCollectonView(with: models[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}
