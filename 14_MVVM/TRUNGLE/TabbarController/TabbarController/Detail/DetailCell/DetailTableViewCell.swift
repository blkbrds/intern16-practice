//
//  DetailTableViewCell.swift
//  TabbarController
//
//  Created by Abcd on 8/18/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    
    //MARK: - IBOutlet
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    //MARK: - Properties
    var viewModel = DetailCellViewModel() {
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
        self.selectionStyle = .none
    }
    
    //MARK: - Function
    func updateView() {
        let dataDetail = viewModel.commentManager
        imageView1.image = UIImage(named: dataDetail.image)
        nameLabel.text = dataDetail.name
        commentLabel.text = dataDetail.comment
        timeLabel.text = dataDetail.time
    }
}
