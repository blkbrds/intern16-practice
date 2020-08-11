//
//  CustomViewCell.swift
//  baitap12
//
//  Created by NXH on 8/6/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

final class CustomViewCell: UICollectionViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
     var cell: Cell = Cell(image: nil, name: nil)
       
       override func awakeFromNib() {
           super.awakeFromNib()
       }
       
       func updateCell() {
        nameLabel.text = cell.nameString
        cellImage.image = UIImage(named: cell.imageString)
        nameLabel.textColor = .red
       }
    

}
