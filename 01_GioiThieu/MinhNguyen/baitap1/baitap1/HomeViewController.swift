//
//  HomeViewController.swift
//  baitap1
//
//  Created by MacBook Pro on 6/23/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var btnTap: UIButton!
    @IBAction func changeColor(_ sender: Any) {
        view.backgroundColor = color()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        btnTap.backgroundColor = .green

        // Do any additional setup after loading the view.
    }
    func color()->UIColor{
        return UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1.0)
    }

}
