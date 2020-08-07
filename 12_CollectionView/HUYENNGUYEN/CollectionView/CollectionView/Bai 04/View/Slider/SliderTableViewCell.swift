//
//  SliderTableViewCell.swift
//  CollectionView
//
//  Created by bu on 8/7/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

class SliderTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var sliderCollectionView: UICollectionView!
    
    private var index = 0
    var numbersOfSlider: [Int] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configCollectionView()
    }
    
    private func configCollectionView() {
        let cellNib = UINib(nibName: "ScrollCollectionViewCell", bundle: Bundle.main)
        sliderCollectionView.register(cellNib, forCellWithReuseIdentifier: "ScrollCollectionViewCell")
        
        sliderCollectionView.dataSource = self
        sliderCollectionView.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction private func turnLeftTouchUpInside(_ sender: UIButton) {
        if index > 0 {
            index -= 1
            sliderCollectionView.scrollToItem(at: IndexPath(item: index, section: 0), at: .centeredHorizontally, animated: true)
        }
    }
    @IBAction private func turnRightTouchUpInside(_ sender: UIButton) {
        if index < 5 {
            index += 1
            sliderCollectionView.scrollToItem(at: IndexPath(item: index, section: 0), at: .centeredHorizontally, animated: true)
        }
    }
}

extension SliderTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numbersOfSlider.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ScrollCollectionViewCell", for: indexPath) as? ScrollCollectionViewCell else {
            return ScrollCollectionViewCell()
        }
        cell.numberLabel.text = "\(numbersOfSlider[indexPath.row])"
        cell.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        return cell
    }
}

extension SliderTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 300)
    }
}
