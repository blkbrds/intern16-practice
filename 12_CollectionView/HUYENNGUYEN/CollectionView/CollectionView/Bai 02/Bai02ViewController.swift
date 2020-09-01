//
//  Bai02ViewController.swift
//  CollectionView
//
//  Created by bu on 8/5/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

class Bai02ViewController: UIViewController {

    //MARK: - IBOutlet
    @IBOutlet weak var collectionView: UICollectionView!

    //MARK: - Properties
    private var images: [String] = ["image1", "image2", "image2", "image3", "image4", "image5", "image6", "image7", "image8", "image9", "image10"]
    private var valueHeight: [CGFloat] = [100, 150, 50, 400, 200, 180, 360, 20, 10, 180]
        
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configCollectionView()
    }
    
    //MARK: - Function
    private func configCollectionView() {
        let layout = PinterestLayout()
        layout.delegate = self
        collectionView.collectionViewLayout = layout
        let nib = UINib(nibName: "CustomCollectionViewCell", bundle: .main)
        collectionView.register(nib, forCellWithReuseIdentifier: "cell")
        collectionView.dataSource = self
    }
}

//MARK: - Extension UICollectionViewDataSource
extension Bai02ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CustomCollectionViewCell else {
            return CustomCollectionViewCell()
        }
        cell.setLabel(name: images[indexPath.row])
        cell.backgroundColor = #colorLiteral(red: 0.9433692893, green: 0.7936577309, blue: 0.7139778097, alpha: 1)
        return cell
    }
    
}

//MARK: - Extension PinterestLayoutDelegate
extension Bai02ViewController: PinterestLayoutDelegate {
    func collectionView(collectionView: UICollectionView, heightForItemAtIndexPath indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width - 10
        return CGSize(width: screenWidth / 3, height: valueHeight.randomElement()!)
    }
}
