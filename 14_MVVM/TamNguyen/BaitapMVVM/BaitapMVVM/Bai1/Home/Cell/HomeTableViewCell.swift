//
//  HomeTableViewCell.swift
//  BaitapMVVM
//
//  Created by PCI0001 on 8/13/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

final class HomeTableViewCell: UITableViewCell {
    
    // MARK: - IBOulets
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    private var viewModel = CollectionViewModel()
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        configCollectionView()
        loadData()
    }
    
    // MARK: - Private methods
    
    private func loadData() {
        viewModel.getData()
    }
    
    private func configCollectionView() {
        let nib = UINib(nibName: "HomeCollectionViewCell", bundle: .main)
        collectionView.register(nib, forCellWithReuseIdentifier: "collectionCell")
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

// MARK: - Extension UICollectionViewDelegate, UICollectionViewDataSource
extension HomeTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.numberOfSection()
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfRowInSection(in: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as? HomeCollectionViewCell else { return UICollectionViewCell()}
        cell.viewModel = viewModel.viewModelForCell(at: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 340, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
