//
//  MyViewController.swift
//  demo
//
//  Created by PCI0001 on 6/23/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {
    var color = 0
    var background = [UIColor.red, UIColor.green, UIColor.blue]
    @IBOutlet weak var btn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
        
    @IBAction func changeColor(_ sender: Any) {
        if color < background.count - 1 {
            self.view.backgroundColor = background[color]
            color += 1
            //self.view.backgroundColor = UIColor.red
        } else {
            color = 0
            self.view.backgroundColor = background[color]	
        }
    
}
}
