//
//  SuperHerosViewController.swift
//  ColectionView
//
//  Created by MacBook Pro on 8/4/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class SuperHerosViewController: UIViewController {

    enum Team: Int{
        case avengers
        case guardians
        case xmen

        var teamName: String {
            switch self {
            case .avengers: return "Avengers"
            case .guardians: return "Guardians"
            case .xmen: return "Xmen"
            }
        }
        var teamAvartar: UIImage {
            switch self {
            case .avengers: return #imageLiteral(resourceName: "h10")
            case .guardians: return #imageLiteral(resourceName: "h10")
            case .xmen: return #imageLiteral(resourceName: "h10")
            }
        }
        var member: [Member] {
            switch self {
            case .avengers: return [Member(name: "Thor", avartar: #imageLiteral(resourceName: "h8")),
                                    Member(name: "Captane", avartar: #imageLiteral(resourceName: "h4")),
                                    Member(name: "Iron Man", avartar: #imageLiteral(resourceName: "h5"))]
            case .guardians: return [Member(name: "Star lord", avartar: #imageLiteral(resourceName: "h")),
                                     Member(name: "Roket racoon", avartar:#imageLiteral(resourceName: "h8")),
                                     Member(name: "Drax", avartar: #imageLiteral(resourceName: "h")),
                                     Member(name: "Groot", avartar: #imageLiteral(resourceName: "h10"))]
            case .xmen: return [Member(name: "Storm", avartar: #imageLiteral(resourceName: "h3")),
                                Member(name: "Beast", avartar: #imageLiteral(resourceName: "h7"))]
            }
        }
        static var count: Int { return Team.xmen.rawValue + 1}
    }

    // MARK: - @IBOulets
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Marvel"
        configCollectionView()
    }

    // MARK: - Private functions
    private func configCollectionView() {
        let cellNib = UINib(nibName: "CustomHeroCollectionViewCell", bundle: Bundle.main)
        collectionView.register(cellNib, forCellWithReuseIdentifier: "CustomHeroCollectionViewCell")
        let hearderNib = UINib(nibName: "HeroCollectionReusableView", bundle: Bundle.main)
        collectionView.register(hearderNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeroCollectionReusableView")
        let footerNib = UINib(nibName: "TeamFooterCollectionReusableView", bundle: Bundle.main)
        collectionView.register(footerNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "TeamFooterCollectionReusableView")
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension SuperHerosViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let team = Team(rawValue: indexPath.section) else {fatalError("team value is nil")}
        guard indexPath.item < team.member.count else { fatalError("member index is out of bounds")}
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomHeroCollectionViewCell", for: indexPath) as! CustomHeroCollectionViewCell
        cell.updateCell(name: team.member[indexPath.item].name, image: team.member[indexPath.item].avartar)
        cell.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let team = Team(rawValue: section) else {fatalError("Team value is nil")}
        return team.member.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Team.count
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let team = Team(rawValue: indexPath.section) else {fatalError("team value is nil")}
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeroCollectionReusableView", for: indexPath) as! HeroCollectionReusableView
            header.updateHeader(name: team.teamName, image: team.teamAvartar)
            header.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
            return header
        case UICollectionView.elementKindSectionFooter:
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "TeamFooterCollectionReusableView", for: indexPath) as! TeamFooterCollectionReusableView
            return footer
        default:
            return UICollectionReusableView()
        }
    }
}

extension SuperHerosViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 3 - 20, height: 180)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 10, bottom: 20, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 100)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 40)
    }
}
