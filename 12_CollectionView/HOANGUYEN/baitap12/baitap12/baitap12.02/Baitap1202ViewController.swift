//
//  Baitap1202ViewController.swift
//  baitap12
//
//  Created by NXH on 8/2/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

final class Baitap1202ViewController: UIViewController {

    // MARK: - @IBOutlet
    @IBOutlet weak var collectionView: UICollectionView!
    
    var originYCells: [CGFloat] = []
    private let sizeCellRandom: [CGSize] = {
        var array: [CGSize] = [CGSize(width: UIScreen.main.bounds.width / 3 - 20, height: 0), CGSize(width: UIScreen.main.bounds.width / 3 - 20, height: 0), CGSize(width: UIScreen.main.bounds.width / 3 - 20, height: 0)]
        for _ in 0..<100 {
            
            array.append(CGSize(width: UIScreen.main.bounds.width / 3 - 20, height: CGFloat.random(in: 100...200)))
        }
        return array
    }()
    
    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        createOriginYCells()
        configCollectionView()
    }
    
    // MARK: - private func
    private func configCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    private func createOriginYCells() {
        var originY1: CGFloat = 0
        var originY2: CGFloat = 0
        var originY3: CGFloat = 0
        for (index, _) in sizeCellRandom.enumerated() {
            switch index % 3 {
            case 0:
                originY1 = originY1 + sizeCellRandom[index].height + 20
                originYCells.append(originY1)
            case 1:
                originY2 = originY2 + sizeCellRandom[index].height + 20
                originYCells.append(originY2)
            default:
                originY3 = originY3 + sizeCellRandom[index].height + 20
                originYCells.append(originY3)
            }
        }
    }
}

extension Baitap1202ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.contentView.backgroundColor = .blue
        cell.frame.origin.y = originYCells[indexPath.row]
        return cell
    }
}

extension Baitap1202ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return sizeCellRandom[indexPath.row + 3]
    }
}
