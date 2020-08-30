//
//  ContentTableViewCell.swift
//  MVVM
//
//  Created by bu on 8/30/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

class ContentTableViewCell: UITableViewCell {

    @IBOutlet private weak var contentLabel: UILabel!
    
    var viewModel: ContentTableViewCellViewModel? {
        didSet {
            updateView()
        }
    }
    
    private func updateView()  {
        guard let viewModel = viewModel else { return }
        contentLabel.text = viewModel.content
    }
}
