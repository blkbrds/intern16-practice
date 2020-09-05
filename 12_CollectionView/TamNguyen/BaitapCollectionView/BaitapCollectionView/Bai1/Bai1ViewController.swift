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
    private var cellIdentifier: String = "cell"
    
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
        collectionView.register(nib, forCellWithReuseIdentifier: cellIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func configCollectionCell() {
        let screenWidth = UIScreen.main.bounds.width - 10
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
        layout.itemSize = CGSize(width: screenWidth/3, height: (screenWidth/3)*5/4)
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5
        collectionView!.collectionViewLayout = layout
    }
}

// MARK: - Extension UICollectionViewDataSource
extension Bai1ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        prepareData.numberOfRowInSection(in: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? HomeCell else { return UICollectionViewCell() }
        cell.updateView(with: model)
        return cell
    }
}
