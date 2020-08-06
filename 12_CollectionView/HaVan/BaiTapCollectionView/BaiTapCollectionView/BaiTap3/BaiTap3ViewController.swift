//
//  BaiTap3ViewController.swift
//  BaiTapCollectionView
//
//  Created by NganHa on 8/4/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

final class BaiTap3ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - Propeties
    private var foodFactory = FoodFacttory()
    private var sectionKey: [String] = []
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        configCollectionView()
    }
    
    // MARK: - Private functions
    private func getData() {
        foodFactory.configData()
        sectionKey = Array(foodFactory.sectionFood.keys)
        sectionKey = sectionKey.sorted(by: {$0 > $1})
    }
    
    private func configCollectionView() {
        title = "JAPANESE FOOD"
        let cellNib = UINib(nibName: "FoodCollectionViewCell", bundle: Bundle.main)
        collectionView.register(cellNib, forCellWithReuseIdentifier: "reusableCell")
        let headerNib = UINib(nibName: "FoodHeaderView", bundle: Bundle.main)
        collectionView.register(headerNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "reusablelHeader")
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

// MARK: - UICollectionViewDataSource
extension BaiTap3ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foodFactory.foodFactory[section].count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return foodFactory.foodFactory.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reusableCell", for: indexPath) as! FoodCollectionViewCell
        let food = foodFactory.foodFactory[indexPath.section][indexPath.row]
        cell.updateFood(with: food.image, name: food.name)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "reusablelHeader", for: indexPath) as! FoodHeaderView
        let name = sectionKey[indexPath.section]
        guard let image = foodFactory.sectionFood[name] else { fatalError()}
        header.updateFood(with: image, name: name)
        return header
    }
    
}

// MARK: - UICollectionViewFlowLayout
extension BaiTap3ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 8, bottom: 10, right: 8)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width - 16
        return CGSize(width: width / 3 - 5 , height: 240)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}
