//
//  ViewControllerC.swift
//  BaiTapNavigation
//
//  Created by PCI0004 on 7/21/20.
//  Copyright © 2020 PCI0004. All rights reserved.
//

import UIKit

final class ViewControllerC: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var nextButton: UIButton!
    @IBOutlet private weak var previousButton: UIButton!
    @IBOutlet private weak var rootButton: UIButton!

    // MARK: - Configure
    private struct Configure {
        static let titleName = "View Controller C"
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Configure.titleName
    }

    // MARK: - IBAction
    @IBAction private func nextTouchUpInside(_ sender: Any) {
        let viewControllerD = ViewControllerD()
        navigationController?.pushViewController(viewControllerD, animated: true)
    }

    @IBAction private func previousTouchUpInside(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

    @IBAction private func rootTouchUpInside(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}
