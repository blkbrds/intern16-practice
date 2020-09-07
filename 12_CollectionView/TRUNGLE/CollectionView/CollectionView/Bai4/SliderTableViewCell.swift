//
//  SliderTableViewCell.swift
//  CollectionView
//
//  Created by Abcd on 8/7/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import UIKit

class SliderTableViewCell: UITableViewCell {
    @IBOutlet weak var sliderCollectionView: UICollectionView!
    
    // MARK: - Properties
    var dataSliders: [Int] = []
    private var index = 0
    
    // MARK: - Override
    override func awakeFromNib() {
        super.awakeFromNib()
        let nib = UINib(nibName: "bai4HomeCell", bundle: Bundle.main)
        sliderCollectionView.register(nib, forCellWithReuseIdentifier: "bai4HomeCell")
        sliderCollectionView.dataSource = self
        sliderCollectionView.delegate = self
        sliderCollectionView.bounces = false
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - IBAction
    @IBAction func backPressed(_ sender: Any) {
        if index > 0 {
            index -= 1
            sliderCollectionView.scrollToItem(at: IndexPath(item: self.index, section: 0), at: .centeredHorizontally, animated: true)
        }
    }
    
    @IBAction func forwardPressed(_ sender: Any) {
        if index < dataSliders.count - 1 {
            index += 1
            sliderCollectionView.scrollToItem(at: IndexPath(item: self.index, section: 0), at: .centeredHorizontally, animated: true)
        }
    }
}
    // MARK: - UICollectionViewDataSource
extension SliderTableViewCell : UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSliders.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bai4HomeCell", for: indexPath) as! bai4HomeCell
        cell.cellButton.setTitle(String(dataSliders[indexPath.row]), for: .normal)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 300)
    }
}
