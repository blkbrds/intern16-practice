//
//  Bai11CustomTableViewCell.swift
//  BaitapTableView
//
//  Created by PCI0001 on 7/31/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

final class Bai11CustomTableViewCell: UITableViewCell {
    
    // MARK: - IBOulets
    @IBOutlet private weak var poemLabel: UILabel!
    
    // MARK: - Properties
    var poemForCell = PoemForCell() {
        didSet {
            updateView()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    // MARK: - Private methods
    private func updateView() {
        let poem = poemForCell.poem
        poemLabel.text = poem.contentPoem
    }
}
