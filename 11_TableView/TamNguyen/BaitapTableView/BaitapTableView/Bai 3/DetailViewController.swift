//
//  DetailViewController.swift
//  BaitapTableView
//
//  Created by PCI0001 on 7/28/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

final class DetailViewController: UIViewController {
    // MARK: - IBOulets
    @IBOutlet private weak var nameLabel: UILabel!
    
    // MARK: - Properties
    var contactName: String?
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    // MARK: - Private methods
    private func configUI() {
        title = "DETAIL"
        nameLabel.text = contactName
    }
}
