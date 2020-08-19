//
//  ViewControllerD.swift
//  BaiTapNavigation
//
//  Created by PCI0004 on 7/21/20.
//  Copyright © 2020 PCI0004. All rights reserved.
//

import UIKit

// MARK: - Configure
private struct Configure {
    static let titleName = "View Controller D"
}

final class ViewControllerD: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var nextButton: UIButton!
    @IBOutlet private weak var viewControllerCButton: UIButton!
    @IBOutlet private weak var viewControllerBButton: UIButton!
    @IBOutlet private weak var rootButton: UIButton!

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Configure.titleName
    }

    // MARK: - IBAction
    @IBAction private func nextTouchUpInside(_ sender: Any) {
        let viewControllerE = ViewControllerE()
        navigationController?.pushViewController(viewControllerE, animated: true)
    }

    @IBAction private func nextCTouchUpInside(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

    @IBAction private func nextBTouchUpInside(_ sender: Any) {
        guard let viewControllerB = self.navigationController?.viewControllers.first(where: { $0 is ViewControllerB }) else { return }
        navigationController?.popToViewController(viewControllerB, animated: true)
    }

    @IBAction private func rootTouchUpInside(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}
