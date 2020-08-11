//
//  Baitap09ViewController.swift
//  baitap09
//
//  Created by NXH on 7/15/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

class AViewController: UIViewController {

// MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "View Controller A"
    }
// MARK: - IBACtion
    @IBAction private func nextButtonTouchUpInside(_ sender: UIButton) {
        let bController = BViewController()
        navigationController?.pushViewController(bController, animated: true)
    }
}
