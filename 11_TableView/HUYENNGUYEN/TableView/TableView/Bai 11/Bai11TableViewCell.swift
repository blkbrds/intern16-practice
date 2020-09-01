//
//  Bai11TableViewCell.swift
//  TableView
//
//  Created by bu on 8/5/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

protocol Bai11TableViewCellDelegate: class {
    func viewcell(_ view: Bai11TableViewCell)
}

class Bai11TableViewCell: UITableViewCell {
    
    // MARK: - IBOutlet
    @IBOutlet weak var contentLabel: UILabel!
    
    // MARK: - Properties
    var content: String = ""
    var delegate: Bai11TableViewCellDelegate?
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    // MARK: - Function
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setContent(text: String) {
        contentLabel.text = text
        self.content = text
    }
}
