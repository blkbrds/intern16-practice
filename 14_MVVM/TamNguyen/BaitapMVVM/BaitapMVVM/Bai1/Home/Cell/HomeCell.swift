//
//  HomeCell.swift
//  BaitapMVVM
//
//  Created by PCI0001 on 8/16/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

final class HomeCell: UITableViewCell {
    
    // MARK: - IBOulets
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var addressLabel: UILabel!
    @IBOutlet private weak var ratingLabel: UILabel!
    @IBOutlet private weak var distanceLabel: UILabel!
    @IBOutlet private weak var favoritesButton: UIButton!
    
    // MARK: - Properties
    private var flagFavoriteButton: Int = 1

    var viewModel = HomeCellModel() {
        didSet {
            updateView()
        }
    }
    enum Display: Int {
        case like = 1
        case unlike = 0
    }
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        configCell()
    }
    
    // MARK: - Private methods
    private func configCell() {
        layer.borderWidth = 1
        layer.borderColor = UIColor.blue.cgColor
    }
    
    private func updateView() {
        let item = viewModel.item
        titleLabel.text = item.nameCafe
        addressLabel.text = item.address
        ratingLabel.text = item.rate
        distanceLabel.text = item.distance
    }
    
    // MARK: - IBActions
    @IBAction private func favoritesButtonTouchUpInSide(_sender: UIButton) {
        guard let display = Display(rawValue: flagFavoriteButton) else { return }
        switch display {
        case .like:
            favoritesButton.tintColor = .yellow
            flagFavoriteButton = Display.unlike.rawValue
        default:
            favoritesButton.tintColor = .systemBlue
            flagFavoriteButton = Display.like.rawValue
        }
    }
}
