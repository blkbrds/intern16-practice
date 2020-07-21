//
//  ViewControllerB.swift
//  BaitapNavigation
//
//  Created by PCI0001 on 7/21/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

final class ViewControllerB: UIViewController {
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ViewController B"
    }
    
    // MARK: - IBActions
    @IBAction private func pushViewTouchUpInside(_sender: UIButton) {
        let nextView = ViewControllerC()
        navigationController?.pushViewController(nextView, animated: true)
    }
    
    @IBAction private func popViewTouchUpInside(_sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
