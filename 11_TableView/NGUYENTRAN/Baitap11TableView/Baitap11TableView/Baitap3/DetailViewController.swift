//
//  DetailViewController.swift
//  Baitap11TableView
//
//  Created by MBA0245P on 10/21/20.
//  Copyright © 2020 Tran Thao Nguyen. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var contactName: String = ""
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "DETAIL"
        nameLabel.text = contactName
    }
}
