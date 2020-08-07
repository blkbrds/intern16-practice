//
//  Bai01ViewController.swift
//  CollectionView
//
//  Created by bu on 8/5/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

class Bai01ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigation()
        configCollectionView()
    }
    
    private func configNavigation() {
        title = "Home"
    }
    
    private func configCollectionView() {
        let nib = UINib(nibName: "Bai01CollectionViewCell", bundle: .main)
        collectionView.register(nib, forCellWithReuseIdentifier: "cell")
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension Bai01ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? Bai01CollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.backgroundColor = .black
        cell.setLabel(name: "\(indexPath.item)")
        return cell
    }
    
    
}
