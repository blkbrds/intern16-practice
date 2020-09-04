//
//  ContentTableViewCell.swift
//  MVVM
//
//  Created by bu on 8/30/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

final class ContentTableViewCell: UITableViewCell {

    // MARK: - IBOutlet
    @IBOutlet private weak var contentLabel: UILabel!
    
    // MARK: - Properties
    var viewModel: ContentTableViewCellViewModel? {
        didSet {
            updateView()
        }
    }
    
    // MARK: - Function
    private func updateView()  {
        guard let viewModel = viewModel else { return }
        contentLabel.text = viewModel.content
    }
}
