//
//  Bai3HeaderView.swift
//  BaitapCollectionView
//
//  Created by PCI0001 on 8/5/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

final class Bai3HeaderView: UICollectionReusableView {
    
    // MARK: - IBOulets
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var totalLabel: UILabel!
    
    // MARK: - Public methods
    func updateHeader(with title: String, total: String) {
        titleLabel.text = title
        totalLabel.text = total
    }
}
