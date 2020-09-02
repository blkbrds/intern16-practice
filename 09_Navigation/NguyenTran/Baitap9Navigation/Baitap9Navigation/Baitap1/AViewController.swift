//
//  AViewController.swift
//  Baitap9Navigation
//
//  Created by MBA0245P on 9/1/20.
//  Copyright © 2020 Tran Thao Nguyen. All rights reserved.
//

import UIKit

class AViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "ViewController A"
        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: nil)
        navigationItem.backBarButtonItem = backButton
    }
    
    @IBAction func nextButtonTouchUpInside(_ sender: Any) {
        let viewControllerB = BViewController()
        self.navigationController?.pushViewController(viewControllerB, animated: true)
    }
    




}
