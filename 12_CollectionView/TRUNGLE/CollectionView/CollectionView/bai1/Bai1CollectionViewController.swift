//
//  Bai1CollectionViewController.swift
//  CollectionView
//
//  Created by Abcd on 8/3/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import UIKit

class Bai1CollectionViewController: UIViewController {
    
    //MARK: - IBOutlet
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: - Properties
    var users: [User] = User.getDummyDatas()
    override func viewDidLoad() {
        super.viewDidLoad()
        configCollectionView()
        setUpCellLayout()
    }
    
    private func setUpCellLayout(){
        //1
        let sceenWidth = UIScreen.main.bounds.width - 10
        //2
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: sceenWidth/6, height: (sceenWidth/6) * 6/5)
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5
        //3
        collectionView!.collectionViewLayout = layout
    }
    
    private func configCollectionView() {
        let nib = UINib(nibName: "HomeCell", bundle: .main)
        collectionView.register(nib, forCellWithReuseIdentifier: "cell")
    }
    
}
extension Bai1CollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeCell
        let item = users[indexPath.row]
        cell.label.text = item.name
        cell.backgroundColor = .blue
        return cell
    }
    
    
}
