//
//  ViewControllerB.swift
//  BaitapNavigation
//
//  Created by PCI0001 on 7/21/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

final class BViewController: UIViewController {
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ViewController B"
    }
    
    // MARK: - IBActions
    @IBAction private func pushViewButtonTouchUpInside(_sender: UIButton) {
        let nextView = CViewController()
        navigationController?.pushViewController(nextView, animated: true)
    }
    
    @IBAction private func popViewButtonTouchUpInside(_sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
