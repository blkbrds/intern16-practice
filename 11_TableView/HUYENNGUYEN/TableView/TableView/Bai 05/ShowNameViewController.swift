//
//  ShowNameViewController.swift
//  TableView
//
//  Created by bu on 8/3/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

final class ShowNameViewController: UIViewController {
    
    @IBOutlet private weak var nameLabel: UILabel!
    
    private var profiles: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "NAME"
        nameLabel.text = profiles
    }
}
