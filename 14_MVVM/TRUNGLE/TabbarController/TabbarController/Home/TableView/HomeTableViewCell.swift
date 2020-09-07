//
//  HomeTableViewCell.swift
//  TabbarController
//
//  Created by Abcd on 8/18/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import UIKit
protocol HomeTableViewCellDelegate {
    func view(view: HomeTableViewCell, needsPerform action: HomeTableViewCell.Action)
}

class HomeTableViewCell: UITableViewCell {
    
    //MARK: - IBOutlet
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var inforImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    
    //MARK: - Properties
    var delegate: HomeTableViewCellDelegate?
    var postion: Int?
    var viewModel: HomeCellViewModel? {
        didSet{
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
    
    //MARK: -IBAction
    @IBAction func favoriteButton(_ sender: Any) {
        if favoriteButton.isSelected {
            favoriteButton.tintColor = .systemYellow
            favoriteButton.isSelected = false
            viewModel!.favorite = true
        } else {
            favoriteButton.tintColor = .black
            favoriteButton.isSelected = true
            viewModel!.favorite = false
        }
    }
    
    //MARK: - Function
    private func updateView() {
        inforImageView.image = UIImage(named: viewModel!.image)
        nameLabel.text = viewModel?.name
        addressLabel.text = viewModel?.address
        rateLabel.text = viewModel?.rate
        distanceLabel.text = viewModel?.distance
        if let favorite = viewModel?.favorite {
            if favorite {
            favoriteButton.tintColor = .systemYellow
            favoriteButton.isSelected = false
        } else {
            favoriteButton.tintColor = .black
            favoriteButton.isSelected = true
        }
    }
    }
}

//MARK: - Extension
extension HomeTableViewCell {
    enum Action {
        case favoriteAction( postion: Int, value: Bool)
    }
}
