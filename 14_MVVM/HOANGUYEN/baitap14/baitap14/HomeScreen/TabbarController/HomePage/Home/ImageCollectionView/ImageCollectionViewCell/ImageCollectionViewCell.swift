//
//  imageCollectionViewCell.swift
//  baitap14
//
//  Created by NXH on 8/12/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

final class ImageCollectionViewCell: UICollectionViewCell {
    
    // MARK: - @IBOutlet
    @IBOutlet private weak var image: UIImageView!
    
    // MARK: - Properties
    var viewModel: ImageCollectionViewCellViewModel? {
        didSet {
            updateView()
        }
    }
    
    // MARK: - Public func
    func updateView() {
        guard let name = viewModel?.nameImage else {
            return
        }
        image.image = UIImage(named: name)
    }
}
