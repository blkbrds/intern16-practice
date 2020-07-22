//
//  ViewControllerA.swift
//  BaiTapNavigation
//
//  Created by PCI0004 on 7/21/20.
//  Copyright © 2020 PCI0004. All rights reserved.
//

import UIKit

final class ViewControllerA: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var nextButton: UIButton!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "View Controller A"
    }

    // MARK: - IBActions
    @IBAction func pushTouchUpInside(_ sender: Any) {
        let viewControllerB = ViewControllerB()
        self.navigationController?.pushViewController(viewControllerB, animated: true)
    }
}
