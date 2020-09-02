//
//  Bai11TableViewCell.swift
//  TableView
//
//  Created by MacBook Pro on 7/31/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class Bai11TableViewCell: UITableViewCell {

    // MARK: - @IBOulets
    @IBOutlet private weak var commentLabel: UILabel!
    
    // MARK: - Override functions
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Public functions
    func getComment(comment: String) {
        commentLabel.text = comment
    }
}
