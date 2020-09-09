//
//  HomeCollectionViewCell.swift
//  TabbarController
//
//  Created by Abcd on 8/18/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import UIKit
protocol HomeCollectionViewCellDelegate {
    func view(view: HomeCollectionViewCell, needsPerfom action: HomeCollectionViewCell.Action)
}
class HomeCollectionViewCell: UICollectionViewCell {
    
    //MARK: - IBOutlet
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var rateLabel: UILabel!
    @IBOutlet var distanceLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet weak var favoriteButton: UIButton!
    
    //MARK: - Properties
    var viewModel: HomeCellViewModel? {
        didSet{
            updateView()
        }
    }
    var position: Int?
    var delegate: HomeCollectionViewCellDelegate?
    
    //MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //MARK: - IBAction
    @IBAction func favoritePressed(_ sender: UIButton) {
        if favoriteButton.isSelected {
            favoriteButton.tintColor = .systemYellow
            favoriteButton.isSelected = false
            if let viewModel = viewModel {
                viewModel.favorite = true
            } else { return }
        } else {
            favoriteButton.tintColor = .black
            favoriteButton.isSelected = true
             if let viewModel = viewModel {
                viewModel.favorite = false
             } else { return }
        }
    }

    //MARK: - Function
    func updateView() {
        if let viewModel = viewModel {
            imageView.image = UIImage(named: viewModel.image)
        } else { return }
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
extension HomeCollectionViewCell {
    enum Action {
        case favoriteChange( position: Int, value: Bool)
    }
}
