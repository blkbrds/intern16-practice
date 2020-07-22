//
//  DetailViewController.swift
//  BaiTap11
//
//  Created by hieungq on 7/13/20.
//  Copyright © 2020 hieungq. All rights reserved.
//

import UIKit

final class DetailViewController: UIViewController {

    @IBOutlet private weak var contactNameLabel: UILabel!
    var name: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Detail"
        contactNameLabel.text = name
    }

}
