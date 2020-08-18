//
//  BaiTap03ViewController.swift
//  Collection View
//
//  Created by Phan Ngọc Khánh on 8/10/20.
//  Copyright © 2020 Phan Ngọc Khánh. All rights reserved.
//

import UIKit

final class BaiTap03ViewController: UIViewController {
    
    struct Member {
        var avatar: UIImage
    }
    
    enum Team: Int {
        case avengers
        case guardians
        case xmen
        
        var teamName: String {
            switch self {
            case .avengers: return "Avengers"
            case .guardians: return "Guardians of the galaxy"
            case .xmen: return "X-men"
            }
        }
        
        var members: [Member] {
            switch self {
            case .avengers: return [Member(avatar: #imageLiteral(resourceName: "img-thor")),
                                    Member(avatar: #imageLiteral(resourceName: "img-captain-america")),
                                    Member(avatar: #imageLiteral(resourceName: "img-iron-man")),
                                    Member(avatar: #imageLiteral(resourceName: "img-black-widow")),
                                    Member(avatar: #imageLiteral(resourceName: "img-haweye")),
                                    Member(avatar: #imageLiteral(resourceName: "img-hulk"))]
            case .guardians: return [Member(avatar: #imageLiteral(resourceName: "img-iceman")),
                                     Member(avatar: #imageLiteral(resourceName: "img-rocket-racoon")),
                                     Member(avatar: #imageLiteral(resourceName: "img-gamora")),
                                     Member(avatar: #imageLiteral(resourceName: "img-drax")),
                                     Member(avatar: #imageLiteral(resourceName: "img-groot"))]
            case .xmen: return [Member(avatar: #imageLiteral(resourceName: "img-storm")),
                                Member(avatar: #imageLiteral(resourceName: "img-beast")),
                                Member(avatar: #imageLiteral(resourceName: "img-wolverine"))]
            }
        }
        
        static var count: Int { return Team.xmen.hashValue + 1}
    }
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigationBar()
        configCollectionView()
    }
    
    // MARK: - Private functions
    
    private func configCollectionView() {
        let cellNib = UINib(nibName: "B3CollectionViewCell", bundle: Bundle.main)
        collectionView.register(cellNib, forCellWithReuseIdentifier: "B3CollectionViewCell")
        
        let headerNib = UINib(nibName: "HeaderCollectionReusableView", bundle: Bundle.main)
        collectionView.register(headerNib, forSupplementaryViewOfKind:
            UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderCollectionReusableView")
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func configNavigationBar() {
        title = "MARVEL"
    }
}

// MARK: - Extensions
extension BaiTap03ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Team.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let team = Team(rawValue: section)
            else { fatalError("Team value is nil") }
        return team.members.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let team = Team(rawValue: indexPath.section)
            else { fatalError("Team value is nil") }
        
        guard indexPath.item < team.members.count
            else { fatalError("Member index is out of bounds") }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "B3CollectionViewCell", for: indexPath) as! B3CollectionViewCell
        cell.updateCell(avatar: team.members[indexPath.item].avatar)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let team = Team(rawValue: indexPath.section)
                else { fatalError("Team value is nil") }
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderCollectionReusableView", for: indexPath) as! HeaderCollectionReusableView
            header.updateHeaderView(name: team.teamName)
            return header
            
        default:
            return UICollectionReusableView()
        }
    }
}

extension BaiTap03ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 64, height: 64)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 30)
    }
}
