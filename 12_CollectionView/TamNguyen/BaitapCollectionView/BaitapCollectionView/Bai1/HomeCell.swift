//
//  HomeCell.swift
//  BaitapCollectionView
//
//  Created by PCI0001 on 8/4/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

final class HomeCell: UICollectionViewCell {
    
    // MARK: IBOulets
    @IBOutlet private weak var nameLabel: UILabel!
    
    // MARK: - Properties
    private var model = Item()
        
    // MARK: - Public methods
    func updateView(with model: Item) {
        nameLabel.text = model.name
    }
}
