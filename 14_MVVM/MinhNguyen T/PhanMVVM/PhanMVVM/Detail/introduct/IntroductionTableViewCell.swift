//
//  IntroductionTableViewCell.swift
//  PhanMVVM
//
//  Created by MacBook Pro on 8/20/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class IntroductionTableViewCell: UITableViewCell {

    // MARK: - @IBOutlets
    @IBOutlet private weak var descripLable: UILabel!
    
    var viewModel: IntroductionViewModel? = IntroductionViewModel() {
        didSet {
            updateDescription()
        }
    }
    
    // MARK: - Override functions
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: Private functions
    private func updateDescription() {
        descripLable.text = viewModel?.description
    }
}
