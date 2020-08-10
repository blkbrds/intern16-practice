//
//  MainTableViewCell.swift
//  CollectionView
//
//  Created by bu on 8/7/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    //MARK: - IBOutlet
    @IBOutlet private weak var mainCollectionView: UICollectionView!

    //MARK: - Property
    var numbersOfMain: [Int] = []
    
    //MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        configCollectionView()
    }
    
    //MARK: - Function
    private func configCollectionView() {
        let cellNib = UINib(nibName: "ScrollCollectionViewCell", bundle: Bundle.main)
        mainCollectionView.register(cellNib, forCellWithReuseIdentifier: "ScrollCollectionViewCell")
        
        mainCollectionView.dataSource = self
        mainCollectionView.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

//MARK: - Extension UICollectionViewDataSource
extension MainTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numbersOfMain.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ScrollCollectionViewCell", for: indexPath) as? ScrollCollectionViewCell else {
            return ScrollCollectionViewCell()
        }
        cell.numberLabel.text = "\(numbersOfMain[indexPath.row])"
        cell.backgroundColor = #colorLiteral(red: 0.923362151, green: 0.6216164776, blue: 0.5665037944, alpha: 1)
        return cell
    }
}

//MARK: - Extension UICollectionViewDelegateFlowLayout
extension MainTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
}
