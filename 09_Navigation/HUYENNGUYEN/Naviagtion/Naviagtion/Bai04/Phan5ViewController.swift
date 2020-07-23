//
//  Phan5ViewController.swift
//  Naviagtion
//
//  Created by bu on 7/23/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

class Phan5ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let button = UIBarButtonItem(title: "Right", style: .plain, target: .none, action: .none)
        let button1 = UIBarButtonItem(title: "Mid1", style: .plain, target: .none, action: .none)
        navigationItem.rightBarButtonItems = [button, button1]
        
        let buttonLeft = UIBarButtonItem(barButtonSystemItem: .cancel, target: .none, action: .none)
        navigationItem.leftBarButtonItem = buttonLeft
    }

}
