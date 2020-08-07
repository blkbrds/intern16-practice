//
//  BaiTap2ViewController.swift
//  PhanCollectionView
//
//  Created by MacBook Pro on 8/7/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class BaiTap2ViewController: UIViewController {

    // MARK: - @IBOutlets
    @IBOutlet private weak var collectionView: UICollectionView!

    // MARK: - Properties
    private var numbers: [String] = []
    private var heights: [CGFloat] = []

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        if let layout = collectionView?.collectionViewLayout as? PinterestLayout {
            layout.delegate = self
        }
        configCollection()
    }

    // MARK: - Private functions
    private func configCollection() {
        let cellNid = UINib(nibName: "BaiTap2CollectionViewCell", bundle: Bundle.main)
        collectionView.register(cellNid, forCellWithReuseIdentifier: "cell")
        collectionView.dataSource = self
        addArrNumber()
    }

    private func addArrNumber() {
        for i in 0...50 {
            numbers.append(String(i))
            heights.append(CGFloat.random(in: 20..<200))
        }
    }
}

// MARK: - UICollectionViewDataSource
extension BaiTap2ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numbers.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! BaiTap2CollectionViewCell
        cell.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        return cell
    }
}

// MARK: - PinterestLayoutDelegate
extension BaiTap2ViewController: PinterestLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
        return heights[indexPath.item]
    }
}
