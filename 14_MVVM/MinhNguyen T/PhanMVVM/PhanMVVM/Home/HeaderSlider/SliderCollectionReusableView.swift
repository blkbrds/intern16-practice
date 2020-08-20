//
//  SliderCollectionReusableView.swift
//  PhanMVVM
//
//  Created by MacBook Pro on 8/16/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class SliderCollectionReusableView: UICollectionReusableView {
    
    // MARK: - @IBOutlets
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var pageControl: UIPageControl!
    
    // MARK: - Peroperties
    private var position: Int = 0
    var viewModel = SliderCollectionViewModel()
    
    // MARK: - Override functions
    override func awakeFromNib() {
        super.awakeFromNib()
        configSLider()
        autoSlide()
    }
    
    // MARK: - Private functions
    private func configSLider() {
        let nib = UINib(nibName: "SliderCollectionViewCell", bundle: .main)
        collectionView.register(nib, forCellWithReuseIdentifier: "SliderCollectionViewCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        viewModel.getImageSlider()
        pageControl.numberOfPages = viewModel.sliderImage.count
    }
    
    private func autoSlide() {
        Timer.scheduledTimer(withTimeInterval: 4, repeats: true, block: { (timer) in
            self.position += 1
            if self.position == self.viewModel.sliderImage.count {
                self.position = 0
            }
            self.collectionView.scrollToItem(at: IndexPath(item: self.position, section: 0), at: .centeredHorizontally, animated: true)
            self.pageControl.currentPage = self.position
        })
    }
    
    // MARK: - @IBActions
    @IBAction private func backButtonTouchUpInside(_ sender: UIButton) {
        position -= 1
        if position < 0 {
            position = viewModel.sliderImage.count - 1
        }
        collectionView.scrollToItem(at: IndexPath(item: position, section: 0), at: .centeredHorizontally, animated: true)
        pageControl.currentPage = position
    }
    
    @IBAction private func nextButtonTouchUpInside(_ sender: UIButton) {
        position += 1
        if position == viewModel.sliderImage.count {
            position = 0
        }
        collectionView.scrollToItem(at: IndexPath(item: position, section: 0), at: .centeredHorizontally, animated: true)
        pageControl.currentPage = position
    }
}

extension SliderCollectionReusableView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.sliderImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SliderCollectionViewCell", for: indexPath) as? SliderCollectionViewCell else { return UICollectionViewCell() }
        cell.viewModel = viewModel.getSliderCellModel(atIndexPath: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}
