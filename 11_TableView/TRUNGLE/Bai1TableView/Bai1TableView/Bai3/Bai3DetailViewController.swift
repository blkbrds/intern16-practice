//
//  Bai3DetailViewController.swift
//  Bai1TableView
//
//  Created by Abcd on 7/28/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import UIKit

class Bai3DetailViewController: UIViewController {
    
      //MARK: - IBOutlet
    @IBOutlet weak var nameDetail: UILabel!
    
      //MARK: - Properties
    var name : String  = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        nameDetail.text = name
    }
}
