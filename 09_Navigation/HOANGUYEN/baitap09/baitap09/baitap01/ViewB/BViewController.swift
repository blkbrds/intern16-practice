//
//  BViewController.swift
//  baitap09
//
//  Created by NXH on 7/15/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

class BViewController: UIViewController {

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "View Controller B"
    }
    
    // MARK: - IBACtion
    @IBAction private func nextButtonTouchUpInside(_ sender: UIButton) {
        let cController = CViewController()
        navigationController?.pushViewController(cController, animated: true)
    }
    @IBAction private func preButtonTouchUpInside(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}
