//
//  BaiTap05DetailsViewController.swift
//  BaiTapTableView
//
//  Created by PCI0004 on 8/5/20.
//  Copyright © 2020 PCI0004. All rights reserved.
//

import UIKit

class BaiTap05DetailsViewController: UIViewController {

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
