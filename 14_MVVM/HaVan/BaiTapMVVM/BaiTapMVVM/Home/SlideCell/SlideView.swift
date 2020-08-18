//
//  UISlideView.swift
//  BaiTapMVVM
//
//  Created by NganHa on 8/17/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

final class SlideView: UIView {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var collection: UICollectionView!
    
    
    // MARK: - Propeties
    private var viewModel =  SlideViewModel()
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        configSildeView()
    }
    
    // MARK: - Override functions
    
    // MARK: - Private functions
    private func configSildeView() {
        let nib = UINib(nibName: "SlideCell", bundle: Bundle.main)
        collection.register(nib, forCellWithReuseIdentifier: "SlideCell")
        collection.delegate = self
        collection.dataSource = self
    }
    // MARK: - Public functions
    
    // MARK: - Objc functions
    
    // MARK: - IBActions

}

// MARK: - UIcollectionViewDataSource
extension SlideView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItem()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SlideCell", for: indexPath) as? SlideCell else {
            return UICollectionViewCell()
        }
        cell.viewModel = viewModel.getSlideCellViewModel(atIndexPath: indexPath)
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension SlideView: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.bounds.width - 5 , height: self.bounds.height - 10)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}
