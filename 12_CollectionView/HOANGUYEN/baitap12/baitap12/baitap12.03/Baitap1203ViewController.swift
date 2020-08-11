//
//  Baitap1203ViewController.swift
//  baitap12
//
//  Created by NXH on 8/3/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

final class Baitap1203ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let datasCell: [[Cell]] = [[Cell(image: "image1", name: "Babe"), Cell(image: "image2", name: "Babe2"), Cell(image: "image3", name: "Babe3"), Cell(image: "image4", name: "Babe4"), Cell(image: "image5", name: "Babe5"), Cell(image: "image6", name: "Babe6") ],[Cell(image: "hihi1", name: "HiHi1"), Cell(image: "hihi2", name: "HiHi2"), Cell(image: "hihi3", name: "HiHi3")], [Cell(image: nil, name: "HaHa1"), Cell(image: nil, name: "HaHa2"), Cell(image: nil, name: "HaHa3"), Cell(image: nil, name: "HaHa4"), Cell(image: nil, name: "HaHa5"), Cell(image: nil, name: "HaHa6"), Cell(image: nil, name: "HaHa7"), Cell(image: nil, name: "HaHa8"), Cell(image: nil, name: "HaHa9"), Cell(image: nil, name: "HaHa10")]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configCollectionView()
    }
    
// MARK: - private func
    private func configCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        let nib = UINib(nibName: "CustomViewCell", bundle: .main)
        collectionView.register(nib, forCellWithReuseIdentifier: "cell")
        let header = UINib(nibName: "HeaderView", bundle: .main)
        collectionView.register(header, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
    }
}

extension Baitap1203ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        datasCell.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datasCell[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomViewCell
        cell.cell = datasCell[indexPath.section][indexPath.row]
        cell.updateCell()
        return cell
    }
}

extension Baitap1203ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width / 3 - 20, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header", for: indexPath) as! HeaderView
        header.headerLabel.text = "section \(indexPath.section)"
        return header
    }
}
