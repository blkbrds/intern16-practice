//
//  HeaderCollectionReusableView.swift
//  CollectionView
//
//  Created by bu on 8/6/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {

    @IBOutlet private weak var headerLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setHeader(header: String) {
        headerLabel.text = header
    }
    
}
