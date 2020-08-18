//
//  HeaderCollectionReusableView.swift
//  Collection View
//
//  Created by Phan Ngọc Khánh on 8/10/20.
//  Copyright © 2020 Phan Ngọc Khánh. All rights reserved.
//

import UIKit

final class HeaderCollectionReusableView: UICollectionReusableView {

    @IBOutlet weak var headerView: UILabel!
    @IBOutlet weak var headerLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func updateHeaderView(name: String) {
        headerLabel.text = name
    }
}
