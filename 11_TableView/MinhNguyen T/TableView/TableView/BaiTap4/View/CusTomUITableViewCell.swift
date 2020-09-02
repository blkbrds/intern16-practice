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

final class CusTomUITableViewCell: UITableViewCell {

    // MARK: - @IBOutlets
    @IBOutlet private weak var subtitleLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var imageCell: UIImageView!

    // MARK: - Properties
    private var nameItem: String = ""
    private var indexrow : Int = 0
    weak var delegate: CusTomUITableViewCellDelegate?

    // MARK: - Initialize
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    // MARK: - Public functions
    func configCell(image: UIImage?, namelb: String, titlelb: String, index: Int) {
        imageCell.image = image
        nameLabel.text = namelb
        subtitleLabel.text = titlelb
        indexrow = index
        nameItem = namelb
    }

    // MARK: - @IBActions
    @IBAction private func tapMeButtonTouchUpInside(_ sender: UIButton) {
        delegate?.getNameObject(self, needsPerform: .getNameObject(nameObject: nameItem, index: indexrow))
    }
}

extension CusTomUITableViewCell {
    enum Action {
        case getNameObject(nameObject: String, index: Int)
    }
}
