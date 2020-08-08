//
//  Bai3ViewController.swift
//  BaitapCollectionView
//
//  Created by PCI0001 on 8/5/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

final class Bai3ViewController: UIViewController {
    
    // MARK: - IBOulets
    @IBOutlet weak private var homeCollectionView: UICollectionView!
    
    // MARK: - Properties
    private var flowers: [String] = ["download", "download", "download", "download", "download", "download", "download"]
    private var sections: [String] = ["Loại 1", "Loại 2", "Loại 3", "Loại 4", "Loại 5", "Loại 6", "Loại 7"]
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadNib()
        loadHeader()
    }
    
    // MARK: - Private methods
    private func loadNib() {
        let nib = UINib(nibName: "Bai3CollectionViewCell", bundle: .main)
        homeCollectionView.register(nib, forCellWithReuseIdentifier: "cell")
    }
    
    private func loadHeader() {
        let headerNib = UINib(nibName: "Bai3HeaderView", bundle: .main)
        homeCollectionView.register(headerNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
        let layout = UICollectionViewFlowLayout()
        
        layout.headerReferenceSize = CGSize(width: 0, height: 40)
        homeCollectionView.collectionViewLayout = layout
    }
}

// MARK: - Extension UICollectionViewDataSource
extension Bai3ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return flowers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! Bai3CollectionViewCell
        let nameFlower = flowers[indexPath.row]
        guard let imageFlower = UIImage(named: nameFlower) else { return cell }
        cell.updateCell(with: imageFlower)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let reusableview = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header", for: indexPath) as! Bai3HeaderView
            
            let header = sections[indexPath.row]
            reusableview.updateHeader(with: header, total: String(sections.count))
            return reusableview
        default:
            fatalError("Unexpected element kind")
        }
    }
}
