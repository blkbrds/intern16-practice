//
//  CViewController.swift
//  baitap09
//
//  Created by NXH on 7/15/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

class CViewController: UIViewController {

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "View Controller C"
    }
    
    // MARK: - IBACtion
    @IBAction private func nextButtonTouchUpInside(_ sender: UIButton) {
        let dController = DViewController()
        navigationController?.pushViewController(dController, animated: true)
    }
    
    @IBAction private func preButtonTouchUpInside(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }

    @IBAction private func rootButtonTouchUpInside(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
}
