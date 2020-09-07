//
//  Bai3ViewController.swift
//  CollectionView
//
//  Created by Abcd on 8/5/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import UIKit

class Bai3ViewController: UIViewController {
    //MARK: - IBOutlet
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    private let datas: [[Int]] = [Array(0...6), Array(0...15), Array(0...6), Array(0...25), Array(0...20), Array(0...14), Array(0...18), Array(0...6), Array(0...35), Array(0...30)]
    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLoad()
        title = "Home"
        let nib = UINib(nibName: "Bai3CollectionViewCell", bundle: Bundle.main)
        collectionView.register(nib, forCellWithReuseIdentifier: "cell")
        let headerNib = UINib(nibName: "Bai3SectionHeader", bundle: Bundle.main)
        collectionView.register(headerNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}
//MARK: - Extension
extension Bai3ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return datas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datas[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! Bai3CollectionViewCell
        let item = datas[indexPath.section][indexPath.row]
        cell.buttonCell.setTitle(String(item), for: .normal)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as? Bai3SectionHeader{
            sectionHeader.sectionHeaderLabel.text = "Section \(indexPath.section)"
            return sectionHeader
        }
        return UICollectionReusableView()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         return CGSize(width: 40 , height: 40)
    }
}
