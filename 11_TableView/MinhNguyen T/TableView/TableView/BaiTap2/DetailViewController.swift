//
//  DetailViewController.swift
//  TableView
//
//  Created by MacBook Pro on 7/28/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class DetailViewController: UIViewController {

    // MARK: - IBOulets
    @IBOutlet private weak var nameLabel: UILabel!
    
    // MARK: - Peropeties
    var name: String = ""
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Detail"
        nameLabel.text = name
    }
}
