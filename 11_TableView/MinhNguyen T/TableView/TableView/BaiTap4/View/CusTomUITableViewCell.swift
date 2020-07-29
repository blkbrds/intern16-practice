//
//  CusTomUITableViewCell.swift
//  TableView
//
//  Created by MacBook Pro on 7/29/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

protocol CusTomUITableViewCellDelegate: class {
    func getNameObject(_ controller: CusTomUITableViewCell, needsPerform action: CusTomUITableViewCell.Action)
}

class CusTomUITableViewCell: UITableViewCell {

    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageCell: UIImageView!
    var nameItem: String = ""
    private var indexrow : Int = 0
    weak var delegate: CusTomUITableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(image: UIImage?, namelb: String, titlelb: String, index: Int) {
        imageCell.image = image
        nameLabel.text = namelb
        subtitleLabel.text = titlelb
        indexrow = index
        nameItem = namelb
    }
    
    @IBAction func tapMeButtonTouchUpInside(_ sender: UIButton) {
        delegate?.getNameObject(self, needsPerform: .getNameObject(nameObject: nameItem, index: indexrow))
    }
}
extension CusTomUITableViewCell {
    enum Action {
        case getNameObject(nameObject: String, index: Int)
    }
}
