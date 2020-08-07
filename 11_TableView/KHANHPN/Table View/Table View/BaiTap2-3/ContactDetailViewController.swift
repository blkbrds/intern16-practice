//
//  ContactDetailViewController.swift
//  Table View
//
//  Created by Phan Ngọc Khánh on 7/31/20.
//  Copyright © 2020 Phan Ngọc Khánh. All rights reserved.
//

import UIKit

final class ContactDetailViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet private weak var contactNameLabel: UILabel!
    
    // MARK: - Properties
    var contactName: String = ""
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Detail"
        contactNameLabel.text = contactName
    }
}
