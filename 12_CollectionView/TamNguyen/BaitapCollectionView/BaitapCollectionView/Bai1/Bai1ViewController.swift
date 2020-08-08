//
//  Bai1ViewController.swift
//  BaitapCollectionView
//
//  Created by PCI0001 on 8/4/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

final class Bai1ViewController: UIViewController {
    
    // MARK: - IBOulets
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    private var prepareData = PrepareData()
    private var model = Item()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configCollectionView()
        configCollectionCell()
    }
    
    // MARK: - Private methods
    private func configCollectionView() {
        title = "Home"
        let nib = UINib(nibName: "HomeCell", bundle: .main)
        collectionView.register(nib, forCellWithReuseIdentifier: "cell")
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func configCollectionCell() {
        //1
        let screenWidth = UIScreen.main.bounds.width - 10
        //2
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
        layout.itemSize = CGSize(width: screenWidth/3, height: (screenWidth/3)*5/4)
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5
        //3
        collectionView!.collectionViewLayout = layout
    }
}

// MARK: - Extension UICollectionViewDaTaSource and UICollectionViewDelegate
extension Bai1ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        prepareData.numberOfRowInSection(in: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeCell
        cell.updateView(with: model)
        return cell
    }
}
