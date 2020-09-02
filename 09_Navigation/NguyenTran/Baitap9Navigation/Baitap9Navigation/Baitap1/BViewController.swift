//
//  BViewController.swift
//  Baitap9Navigation
//
//  Created by MBA0245P on 9/1/20.
//  Copyright © 2020 Tran Thao Nguyen. All rights reserved.
//

import UIKit

class BViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "ViewController B"
        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: nil)
        navigationItem.backBarButtonItem = backButton
    }

    @IBAction func nextButtonTouchUpInside(_ sender: Any) {
        let viewControllerC = CViewController()
        self.navigationController?.pushViewController(viewControllerC, animated: true)
    }
    
    @IBAction func previousButtonTouchUpInside(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
