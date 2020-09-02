//
//  CViewController.swift
//  Baitap9Navigation
//
//  Created by MBA0245P on 9/1/20.
//  Copyright © 2020 Tran Thao Nguyen. All rights reserved.
//

import UIKit

class CViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "ViewController C"
        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: nil)
        navigationItem.backBarButtonItem = backButton
    }
    @IBAction func nextButtonTouchUpInside(_ sender: UIButton) {
        let viewControllerD = DViewController()
        navigationController?.pushViewController(viewControllerD, animated: true)
    }
    
    @IBAction func previousButtonTouchUpInside(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func rootButtonTouchUpInside(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}
