//
//  ExerciseFourViewController.swift
//  BaiTap12
//
//  Created by hieungq on 7/15/20.
//  Copyright © 2020 hieu.ngq. All rights reserved.
//

import UIKit

class ExerciseFourViewController: UIViewController {

    @IBOutlet weak var topHeaderCollectionView: UICollectionView!
    @IBOutlet weak var tag1CollectionView: UICollectionView!
    @IBOutlet weak var tag2CollectionView: UICollectionView!
    @IBOutlet weak var tag3CollectionView: UICollectionView!
    @IBOutlet weak var tag4CollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configAllCollection()
    }
    
    private func configAllCollection() {
        topHeaderCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "topHeaderCollectionViewCell")
        topHeaderCollectionView.delegate = self
        topHeaderCollectionView.dataSource = self
        topHeaderCollectionView.isScrollEnabled = false
        
        tag1CollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "tag1CollectionViewCell")
        tag1CollectionView.delegate = self
        tag1CollectionView.dataSource = self
                
        tag2CollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "tag2CollectionViewCell")
        tag2CollectionView.delegate = self
        tag2CollectionView.dataSource = self
                
        tag3CollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "tag3CollectionViewCell")
        tag3CollectionView.delegate = self
        tag3CollectionView.dataSource = self
                
        tag4CollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "tag4CollectionViewCell")
        tag4CollectionView.delegate = self
        tag4CollectionView.dataSource = self
    }
    
    @IBAction func previousButtonTouchUpInside(_ sender: Any) {
        let visibleItems: NSArray = self.topHeaderCollectionView.indexPathsForVisibleItems as NSArray
        let currentItem: IndexPath = visibleItems.object(at: 0) as! IndexPath
        let nextItem: IndexPath = IndexPath(item: currentItem.item - 1, section: 0)
        if nextItem.row < 10 && nextItem.row >= 0{
            self.topHeaderCollectionView.scrollToItem(at: nextItem, at: .centeredHorizontally, animated: true)

        }
    }
    
    @IBAction func nextButtonTouchUpInside(_ sender: Any) {
         let visibleItems: NSArray = self.topHeaderCollectionView.indexPathsForVisibleItems as NSArray
         let currentItem: IndexPath = visibleItems.object(at: 0) as! IndexPath
         let nextItem: IndexPath = IndexPath(item: currentItem.item + 1, section: 0)
         if nextItem.row < 10 {
             self.topHeaderCollectionView.scrollToItem(at: nextItem, at: .centeredHorizontally, animated: true)

         }
    }
}

extension ExerciseFourViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == tag1CollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tag1CollectionViewCell", for: indexPath)
            cell.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            return cell
        } else if collectionView == topHeaderCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "topHeaderCollectionViewCell", for: indexPath)
            cell.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            return cell
        } else if collectionView == tag3CollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tag3CollectionViewCell", for: indexPath)
            cell.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            return cell
        } else if collectionView == tag4CollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tag4CollectionViewCell", for: indexPath)
            cell.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            return cell
        } else if collectionView == tag2CollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tag2CollectionViewCell", for: indexPath)
            cell.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            return cell
        }
        return UICollectionViewCell()        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == topHeaderCollectionView {
            return CGSize(width: UIScreen.main.bounds.width - 16, height: 200)
        } else {
            return CGSize(width: 50, height: 50)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
}
