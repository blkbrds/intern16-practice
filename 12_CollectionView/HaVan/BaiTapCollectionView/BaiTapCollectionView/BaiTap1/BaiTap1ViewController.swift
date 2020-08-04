//
//  BaiTap1ViewController.swift
//  BaiTapCollectionView
//
//  Created by NganHa on 8/4/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

final class BaiTap1ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - Propeties
    private var listNumber: [Int] = []
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configData()
        configCollectionView()
    }
    
    // MARK: - Private functions
    private func configData() {
        for index in 0...50 {
            listNumber.append(index)
        }
    }
    
    private func configCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "reusableCell")
    }
}

// MARK: - UICollectionViewDataSource
extension BaiTap1ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listNumber.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reusableCell", for: indexPath)
        cell.backgroundColor = .blue
        let label = UILabel(frame: CGRect(x: cell.bounds.width - cell.bounds.width / 2 - 10, y: cell.bounds.height - cell.bounds.height / 2 - 10, width: cell.bounds.width / 2, height: cell.bounds.height / 2))
        label.text = String(listNumber[indexPath.item])
        label.textColor = .white
        cell.addSubview(label)
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension BaiTap1ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = UIScreen.main.bounds.width / 5 - 18
        return CGSize(width: size , height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    private func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, maximumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
}
