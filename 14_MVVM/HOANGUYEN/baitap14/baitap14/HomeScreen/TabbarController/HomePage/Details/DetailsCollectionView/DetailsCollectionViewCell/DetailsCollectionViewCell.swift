//
//  DetailsCollectionViewCell.swift
//  baitap14
//
//  Created by NXH on 8/17/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

final class DetailsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var imageCell: UIImageView!
    
    // MARK: - Properties
    var viewModel: DetailsCollectionViewCellViewModel? {
        didSet {
            updateView()
        }
    }
    
    // MARK: - Public func
    private func updateView() {
        guard let name = viewModel?.nameImage else {
            return
        }
        imageCell.image = UIImage(named: name)
    }
}
