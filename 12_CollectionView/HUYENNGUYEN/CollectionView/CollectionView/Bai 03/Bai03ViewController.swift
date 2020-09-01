//
//  Bai03ViewController.swift
//  CollectionView
//
//  Created by bu on 8/6/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

class Bai03ViewController: UIViewController {

    //MARK: - IBOutlet
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: - Properties
    var images: [[String]] = [["image1", "image2", "image3"], ["image4", "image5", "image6"], ["image7", "image8", "image9"]]
    var sections: [String] = []
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSections()
        configCollectionView()
    }
    
    //MARK: - Function
    private func configCollectionView() {
        let cellNib = UINib(nibName: "Bai03CollectionViewCell", bundle: Bundle.main)
        collectionView.register(cellNib, forCellWithReuseIdentifier: "Bai03CollectionViewCell")
        
        let header = UINib(nibName: "HeaderCollectionReusableView", bundle: .main)
        collectionView.register(header, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func addSections() {
        for item in 0..<images.count {
            sections.append("Section \(String(item + 1))")
        }
    }
}

//MARK: - Extension
extension Bai03ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Bai03CollectionViewCell", for: indexPath) as? Bai03CollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.setLabel(image: images[indexPath.section][indexPath.row])
        cell.backgroundColor = #colorLiteral(red: 0.9433692893, green: 0.7936577309, blue: 0.7139778097, alpha: 1)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 3.5, height: collectionView.frame.width / 3.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as? HeaderCollectionReusableView {
            sectionHeader.setHeader(header: sections[indexPath.section])
            return sectionHeader
        }
        return UICollectionReusableView()
    }
}
