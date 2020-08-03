//
//  CustomBai11TableViewCell.swift
//  Bai1TableView
//
//  Created by Abcd on 8/2/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import UIKit

class CustomBai11TableViewCell: UITableViewCell {
    //MARK: - IBOutlet
    @IBOutlet weak var label: UILabel!
    
    //MARK: - Properties
    var viewModel = Bai11ModelCell() {
        didSet{
            updateView()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK: - func
    private func updateView() {
        let data = viewModel.data
        label.text = data
    }
}
