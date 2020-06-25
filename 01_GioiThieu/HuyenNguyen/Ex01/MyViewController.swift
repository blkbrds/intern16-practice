//
//  MyViewController.swift
//  Ex01
//
//  Created by bu on 6/23/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {
    var backgroundColor = [UIColor.red, UIColor.blue, UIColor.yellow]
    
    var index = 0
    @IBOutlet weak var button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func actionCHange(_ sender: Any) {
        if index < backgroundColor.count - 1 {
        index += 1
        } else {
            index = 0
        }
        view.backgroundColor = backgroundColor[index]
    }
    
}
