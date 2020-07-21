//
//  ViewControllerA.swift
//  BaitapNavigation
//
//  Created by PCI0001 on 7/21/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

final class ViewControllerA: UIViewController {
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ViewController A"
    }
    
    //MARK: - IBActions
    @IBAction private func pushViewTouchUpInside(_sender: UIButton) {
        let nextView = ViewControllerB()
        navigationController?.pushViewController(nextView, animated: true)
    }
}
