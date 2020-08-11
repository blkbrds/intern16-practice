//
//  Baitap1204ViewController.swift
//  baitap12
//
//  Created by NXH on 8/3/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

final class Baitap1204ViewController: UIViewController {

    
    @IBOutlet weak var mainCollectionView: UICollectionView!
    @IBOutlet weak var tag1CollectionView: UICollectionView!
    @IBOutlet weak var tag2CollectionView: UICollectionView!
    @IBOutlet weak var tag3CollectionView: UICollectionView!
    
    private var current: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configCollectionView()
    }
    
// MARK: - private func
    private func configCollectionView() {
        mainCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "mainCell")
        mainCollectionView.isScrollEnabled = false
        tag1CollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "tag1Cell")
        tag2CollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "tag2Cell")
        tag3CollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "tag3Cell")
        mainCollectionView.dataSource = self
        tag1CollectionView.dataSource = self
        tag2CollectionView.dataSource = self
        tag3CollectionView.dataSource = self
    }
    @IBAction func backButtonTouchUpInside(_ sender: UIButton) {
        var back = current - 1
               if back >= 0 {
                   mainCollectionView.scrollToItem(at: IndexPath(row: back, section: 0), at: .left, animated: true)
               } else {
                   back = 0
               }
         current = back
           }
    
    @IBAction func nextButtonTouchUpInside(_ sender: UIButton) {
        var next = current + 1
        if next < 8 {
            mainCollectionView.scrollToItem(at: IndexPath(row: next, section: 0), at: .left, animated: true)
        } else {
            next = 7
        }
         current = next
    }
}

extension Baitap1204ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView.tag {
        case 0:
            let cell = mainCollectionView.dequeueReusableCell(withReuseIdentifier: "mainCell", for: indexPath)
                cell.contentView.backgroundColor = .green
            return cell
        case 1:
            let cell = tag1CollectionView.dequeueReusableCell(withReuseIdentifier: "tag1Cell", for: indexPath)
                cell.contentView.backgroundColor = .yellow
            return cell
        case 2:
            let cell = tag2CollectionView.dequeueReusableCell(withReuseIdentifier: "tag2Cell", for: indexPath)
                cell.contentView.backgroundColor = .red
            return cell
        default:
            let cell = tag3CollectionView.dequeueReusableCell(withReuseIdentifier: "tag3Cell", for: indexPath)
                cell.contentView.backgroundColor = .blue
            return cell
        }
    }
}

