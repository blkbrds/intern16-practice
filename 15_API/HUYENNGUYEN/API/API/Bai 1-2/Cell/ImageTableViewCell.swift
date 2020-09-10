//
//  ImageTableViewCell.swift
//  API
//
//  Created by bu on 9/1/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

class ImageTableViewCell: UITableViewCell {
    
    //MARK: - Outlet
    @IBOutlet private weak var showImageView: UIImageView!
    
    //MARK: - Property
    var viewModel: ImageTableViewCellViewModel? {
        didSet {
            updateView()
        }
    }
    
    //MARK: - Function
    private func updateView() {
        guard let viewModel = viewModel else { return }
        if let imageURL = viewModel.imageName {
            showImageView.setImage(from: imageURL)
        } else {
            showImageView.image = nil
        }
    }
}
