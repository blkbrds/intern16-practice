//
//  HomeSlideView.swift
//  BaiTap14
//
//  Created by PCI0020 on 7/20/20.
//  Copyright © 2020 hieu.ngq. All rights reserved.
//

import UIKit

class HomeSlideView: UICollectionReusableView {

    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var previousButton: UIButton!
    @IBOutlet private weak var nextButton: UIButton!
    @IBOutlet private weak var pageControl: UIPageControl!
    
    private let homeSlideViewModel = HomeSlideViewModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let nib = UINib(nibName: "SlideCell", bundle: Bundle.main)
        collectionView.register(nib, forCellWithReuseIdentifier: "imageCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        homeSlideViewModel.getData()
        pageControl.numberOfPages = homeSlideViewModel.numberOfImages()
    }

    @IBAction func previousButtonTouchUpInside(_ sender: Any) {
        homeSlideViewModel.changImage(slideChange: .previous, collection: collectionView, items: homeSlideViewModel.numberOfImages(),pageControll: pageControl)
    }
    
    @IBAction func nextButtonTouchUpInside(_ sender: Any) {
        homeSlideViewModel.changImage(slideChange: .next, collection: collectionView, items: homeSlideViewModel.numberOfImages(),pageControll: pageControl)
    }
}

extension HomeSlideView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeSlideViewModel.numberOfImages()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as? SlideCell else { return UICollectionViewCell() }
        cell.viewModel = homeSlideViewModel.cellForItemAt(indexPath: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width - 16, height: self.frame.height - 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    
}
