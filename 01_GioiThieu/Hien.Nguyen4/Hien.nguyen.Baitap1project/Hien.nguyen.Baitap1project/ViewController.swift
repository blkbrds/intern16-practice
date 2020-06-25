//
//  ViewController.swift
//  Hien.nguyen.Baitap1project
//
//  Created by MBA0036 on 6/23/20.
//  Copyright © 2020 MBA0036. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let colors: [UIColor] = [.red, .green, .blue, .yellow, .brown, .darkGray, .orange, .black, .white, .purple]

    @IBAction func tap(_ sender: Any) {
        view.backgroundColor = colors.randomElement()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
