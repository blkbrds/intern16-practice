//
//  ExerciseTwoViewController.swift
//  BaiTap12
//
//  Created by PCI0020 on 7/15/20.
//  Copyright © 2020 hieu.ngq. All rights reserved.
//

import UIKit

final class ExerciseOneViewController: UIViewController {

    @IBOutlet private weak var collectionView: UICollectionView!
    
    private let internMember: [String] = ["Hieu ng", "Trin Nguyen", "Khanh Phan", "Trin Nguyen", "Khanh Phan", "Trin Nguyen", "Khanh Phan", "Trin Nguyen", "Khanh Phan", "Trin Nguyen", "Khanh Phan", "Trin Nguyen", "Khanh Phan", "Trin Nguyen", "Khanh Phan", "Trin Nguyen", "Khanh Phan", "Trin Nguyen", "Khanh Phan"]
    private let mentor: [String] = ["Bien Le", "Tien Le", "Hai Nguyen" ,"Khoa Nguyen" ,"Tien Le", "Hai Nguyen" ,"Khoa Nguyen","Tien Le", "Hai Nguyen" ,"Khoa Nguyen","Tien Le", "Hai Nguyen" ,"Khoa Nguyen","Tien Le", "Hai Nguyen" ,"Khoa Nguyen","Tien Le", "Hai Nguyen" ,"Khoa Nguyen","Tien Le", "Hai Nguyen" ,"Khoa Nguyen"]
    private var atIosTeam: [[String]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configCollectionView()
        atIosTeam = [internMember, mentor]
    }
    
    private func configCollectionView() {
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.delegate = self
        collectionView.dataSource = self
        let headerNib = UINib(nibName: "HeaderReusableView", bundle: Bundle.main)
        collectionView.register(headerNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderReusableView")
    }
}

extension ExerciseOneViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return atIosTeam.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return atIosTeam[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        let label = UILabel()
        label.text = String(atIosTeam[indexPath.section][indexPath.row])
        label.backgroundColor = .blue
        label.textColor = .white
        label.textAlignment = .center
        label.frame = cell.bounds
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        cell.addSubview(label)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderReusableView", for: indexPath) as! HeaderReusableView
            switch atIosTeam[indexPath.section] {
            case internMember:
                headerView.headerLabel.text = "Intern Member"
            default:
                headerView.headerLabel.text = "Mentor Team"
            }
            return headerView
        default:
            return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
            return CGSize(width: collectionView.frame.width, height: 50)
    }
}
