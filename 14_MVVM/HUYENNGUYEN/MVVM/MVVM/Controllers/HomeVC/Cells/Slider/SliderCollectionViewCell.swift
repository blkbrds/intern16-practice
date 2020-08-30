//
//  SliderCollectionViewCell.swift
//  MVVM
//
//  Created by bu on 8/24/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

class SliderCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var sliderImageView: UIImageView!

    override func  awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setImage(image: UIImage?) {
        sliderImageView.image = image
    }
    
}
