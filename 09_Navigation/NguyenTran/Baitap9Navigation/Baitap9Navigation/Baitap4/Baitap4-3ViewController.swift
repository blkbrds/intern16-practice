//
//  Baitap4-3ViewController.swift
//  Baitap9Navigation
//
//  Created by MBA0245P on 10/12/20.
//  Copyright © 2020 Tran Thao Nguyen. All rights reserved.
//

import UIKit

class Baitap4_3ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Bar Button Test"
        let questionItem = UIBarButtonItem(image: UIImage(named: "question"), style: .plain, target: self, action: #selector(tap))
        navigationItem.rightBarButtonItem = questionItem
        navigationController?.navigationBar.tintColor = .blue
        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: nil)
        navigationItem.backBarButtonItem = backButton
        navigationController?.navigationBar.barTintColor = .white
    }
    
    @objc func tap() {
        let viewController = Baitap4_4ViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}
