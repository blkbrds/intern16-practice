//
//  Bai5DetailViewController.swift
//  Bai1TableView
//
//  Created by Abcd on 7/28/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import UIKit

class Bai5DetailViewController: UIViewController {
    
      //MARK: - IBOutlet
    @IBOutlet weak var labelName: UILabel!
    
      //MARK: - Properties
    var name = ""
    
      //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        labelName.text = name
    }
}
