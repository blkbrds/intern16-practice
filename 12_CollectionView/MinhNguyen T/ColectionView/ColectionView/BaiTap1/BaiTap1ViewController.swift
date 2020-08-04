//
//  BaiTap1ViewController.swift
//  ColectionView
//
//  Created by MacBook Pro on 8/4/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class BaiTap1ViewController: UIViewController {
    
    // MARK: - @IBOulets
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    private var numbers = Number()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configCollection()
    }
    
    // MARK: - Private functions
    private func configCollection() {
        let cellNid = UINib(nibName: "CustomCollectionViewCell", bundle: Bundle.main)
        collectionView.register(cellNid, forCellWithReuseIdentifier: "cell")
        collectionView.dataSource = self
        collectionView.delegate = self
        addArrNumber()
    }
    
    private func addArrNumber() {
        for i in 0...50 {
            numbers.number.append(String(i))
        }
    }
}

extension BaiTap1ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numbers.number.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionViewCell
        cell.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        cell.setNumberLabel(number: numbers.number[indexPath.row])
        return cell
    }
}

extension BaiTap1ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 70, height: 70)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 15, left: 5, bottom: 5, right: 5)
    }
}
