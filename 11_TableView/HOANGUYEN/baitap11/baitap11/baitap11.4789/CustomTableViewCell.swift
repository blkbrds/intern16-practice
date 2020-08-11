//
//  CustomTableViewCell.swift
//  baitap11
//
//  Created by NXH on 7/30/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

protocol CustomTableViewCellDelegate: class {
    func view(_ view: CustomTableViewCell, needsPerform action: CustomTableViewCell.Action)
}
final class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var subCell: UILabel!
    @IBOutlet weak var titleCell: UILabel!
    
    // MARK: - properties
    weak var delegate: CustomTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    @IBAction func buttonCellTouchUpInside(_ sender: UIButton) {
        delegate?.view(self, needsPerform: .tapme)
    }
}
extension CustomTableViewCell {
    enum Action {
        case tapme
    }
}
