//
//  ViewControllerA.swift
//  BaiTapNavigation
//
//  Created by PCI0004 on 7/21/20.
//  Copyright © 2020 PCI0004. All rights reserved.
//

import UIKit

// MARK: - Configure
private struct Configure {
    static let titleName = "View Controller A"
}

final class ViewControllerA: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var nextButton: UIButton!

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Configure.titleName
    }

    // MARK: - IBActions
    @IBAction private func pushTouchUpInside(_ sender: Any) {
        let viewControllerB = ViewControllerB()
        navigationController?.pushViewController(viewControllerB, animated: true)
    }
}
