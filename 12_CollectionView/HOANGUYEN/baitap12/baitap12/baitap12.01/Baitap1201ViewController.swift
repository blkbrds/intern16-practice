//
//  Baitap1201ViewController.swift
//  baitap12
//
//  Created by NXH on 8/2/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

final class Baitap1201ViewController: UIViewController {
    
    // MARK: - @IBOulet
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configCollectionView()
    }
    
    // MARK: - private func
    private func configCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    private func handleLabel(label: UILabel){
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .white
    }
}

// MARK: - extension UICollectionViewDataSource
extension Baitap1201ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        let textLabel: UILabel = UILabel()
        handleLabel(label: textLabel)
        cell.contentView.addSubview(textLabel)
        textLabel.centerXAnchor.constraint(equalToSystemSpacingAfter: cell.contentView.centerXAnchor, multiplier: 1).isActive = true
        textLabel.centerYAnchor.constraint(equalToSystemSpacingBelow: cell.contentView.centerYAnchor, multiplier: 1).isActive = true
        textLabel.text = String(indexPath.row)
        cell.contentView.backgroundColor = .blue
        return cell
    }
}

// MARK: - extension UICollectionViewDelegateFlowLayout
extension Baitap1201ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let space: CGFloat = 10
        // 5 cell - 6 space
        return CGSize(width: (UIScreen.main.bounds.width - 6 * space) / 5, height: (UIScreen.main.bounds.width - 6 * space) / 5)
    }
}
