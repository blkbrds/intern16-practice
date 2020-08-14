//
//  SlideView.swift
//  BaiTapCollectionView
//
//  Created by NganHa on 8/5/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

final class SlideView: UIView {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - Propeties
    private let slide = SlideManagement()
    private var index = 0
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        configSlideCell()
    }
    
    // MARK: - Private functions
    private func configSlideCell() {
        let nib = UINib(nibName: "ImageCell", bundle: Bundle.main)
        collectionView.register(nib, forCellWithReuseIdentifier: "reusableCell")
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    // MARK: - IBActions
    @IBAction private func leftButtonTouchUpInside(_ sender: UIButton) {
        if index <= 0 {
            index = 0
        } else {
            index -= 1
        }
        collectionView.scrollToItem(at: IndexPath(item: index, section: 0), at: .centeredHorizontally, animated: true)
    }
    
    @IBAction private func rightButtonTouchUpInside(_ sender: UIButton) {
        if index >= slide.slide.count - 1 {
            index = slide.slide.count - 1
        } else {
            index += 1
        }
        collectionView.scrollToItem(at: IndexPath(item: index, section: 0), at: .centeredHorizontally, animated: true)
    }
}

// MARK: - UICollectionViewDataSource
extension SlideView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slide.slide.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reusableCell", for: indexPath) as? ImageCell else { fatalError("Can't load ImageCell") }
        cell.configImageCell(image: slide.slide[indexPath.item])
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension SlideView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: self.bounds.height)
    }
}
