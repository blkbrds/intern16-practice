//
//  SlideReusableView.swift
//  BaiTapMVVM
//
//  Created by NganHa on 8/19/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

final class SlideReusableView: UICollectionReusableView {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var pageControl: UIPageControl!
    
    // MARK: - Propeties
    var viewModel = SlideViewModel()
    private var countImage = 0
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        configCollectionView()
    }
    
    // MARK: - Private functions
    private func configCollectionView() {
        let nib = UINib(nibName: "SlideCell", bundle: Bundle.main)
        collectionView.register(nib, forCellWithReuseIdentifier: "SlideCell")
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    // MARK: - IBActions
    @IBAction private func rightButtonTouchUpInside(_ sender: UIButton) {
        countImage += 1
        if countImage >= viewModel.numberOfImageSlideItem() - 1 {
            countImage = viewModel.numberOfImageSlideItem() - 1
        }
        pageControl.currentPage = countImage
        collectionView.scrollToItem(at: IndexPath(item: countImage, section: 0), at: .right, animated: true)
    }
    
    @IBAction private func leftButtonTouchUpInside(_ sender: UIButton) {
        countImage -= 1
        if countImage <= 0 {
            countImage = 0
        }
        pageControl.currentPage = countImage
        collectionView.scrollToItem(at: IndexPath(item: countImage, section: 0), at: .left, animated: true)
    }
}

// MARK: - UICollectionViewDataSource
extension SlideReusableView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SlideCell", for: indexPath) as? SlideCell else { return UICollectionViewCell() }
        cell.viewModel = viewModel.getSlideCellViewModel(atIndexPath: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfImageSlideItem()
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension SlideReusableView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
}
