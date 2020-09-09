//
//  ImageTableViewCell.swift
//  API
//
//  Created by bu on 9/1/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

class ImageTableViewCell: UITableViewCell {

    @IBOutlet weak var showImageView: UIImageView!
    
    var viewModel: ImageTableViewCellViewModel? {
        didSet {
            updateView()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    private func updateView() {
        guard let viewModel = viewModel else { return }
        if let imageURL = viewModel.imageName {
            API.shared().dowloadImage(url: imageURL) { [weak self] (image) in
                guard let this = self else { return }
                this.showImageView.image = image
            }
        } else {
            showImageView.image = nil
        }
    }
}
