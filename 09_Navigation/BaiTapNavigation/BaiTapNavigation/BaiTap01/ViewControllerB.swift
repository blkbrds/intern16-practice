//
//  ViewControllerB.swift
//  BaiTapNavigation
//
//  Created by PCI0004 on 7/21/20.
//  Copyright © 2020 PCI0004. All rights reserved.
//

import UIKit

// MARK: - Configure
private struct Configure {
    static let titleName = "View Controller B"
}

final class ViewControllerB: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var nextButton: UIButton!
    @IBOutlet private weak var previousButton: UIButton!

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Configure.titleName
    }

    // MARK: IBActions
    @IBAction private func pushTouchUpInside(_ sender: Any) {
        let viewControllerC = ViewControllerC()
        navigationController?.pushViewController(viewControllerC, animated: true)
    }

    @IBAction private func popTouchUpInside(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
