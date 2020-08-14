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
        let nib = UINib(nibName: "SquareNumberCell", bundle: Bundle.main)
        collectionView.register(nib, forCellWithReuseIdentifier: "SquareNumberCell")
    }
}

// MARK: - UICollectionViewDataSource
extension BaiTap1ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listNumber.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SquareNumberCell", for: indexPath) as? SquareNumberCell else { fatalError("Can't load SquareNumberCell") }
        cell.backgroundColor = .blue
        cell.getNumber(with: String(listNumber[indexPath.item]))
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
}
