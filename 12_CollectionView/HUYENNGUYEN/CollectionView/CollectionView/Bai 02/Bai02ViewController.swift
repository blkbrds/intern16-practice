//
//  Bai02ViewController.swift
//  CollectionView
//
//  Created by bu on 8/5/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

class Bai02ViewController: UIViewController {

    private var images: [String] = ["image1", "image2", "image2", "image3", "image4", "image5", "image6", "image7", "image8", "image9", "image10"]
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configCollectionView()
    }
    
    private func configCollectionView() {
        let layout = PinterestLayout()
        layout.delegate = self
        collectionView.collectionViewLayout = layout
        let nib = UINib(nibName: "CustomCollectionViewCell", bundle: .main)
        collectionView.register(nib, forCellWithReuseIdentifier: "cell")
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension Bai02ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CustomCollectionViewCell else {
            return CustomCollectionViewCell()
        }
        cell.setImage(image: UIImage(named: images[indexPath.row]))
        return cell
    }
    
}

extension Bai02ViewController: PinterestLayoutDelegate {
    func collectionView(collectionView: UICollectionView, heightForItemAtIndexPath indexPath: IndexPath) -> CGSize {
        guard let image = UIImage(named: images[indexPath.row]) else { return .zero }
        return image.size
    }
}
