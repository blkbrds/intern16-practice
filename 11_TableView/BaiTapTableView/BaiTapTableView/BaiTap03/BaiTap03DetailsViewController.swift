//
//  BaiTap03DetailsViewController.swift
//  BaiTapTableView
//
//  Created by PCI0004 on 8/4/20.
//  Copyright © 2020 PCI0004. All rights reserved.
//

import UIKit

final class BaiTap03DetailsViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var nameLabel: UILabel!

    // MARK: - Properties
    var name: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Details"
        configUI()
    }

    // MARK: - Private functions
    private func configUI() {
        nameLabel.text = name
    }
}
