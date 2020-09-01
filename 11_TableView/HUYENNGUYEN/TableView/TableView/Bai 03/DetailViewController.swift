//
//  DetailViewController.swift
//  TableView
//
//  Created by bu on 8/2/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    var profiles: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "DETAIL"
        nameLabel.text = profiles
    }    
}
