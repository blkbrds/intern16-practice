//
//  ViewControllerD.swift
//  BaiTapNavigation
//
//  Created by PCI0004 on 7/21/20.
//  Copyright © 2020 PCI0004. All rights reserved.
//

import UIKit

final class ViewControllerD: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var nextButton: UIButton!
    @IBOutlet private weak var viewControllerCButton: UIButton!
    @IBOutlet private weak var viewControllerBButton: UIButton!
    @IBOutlet private weak var rootButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "View Controller D"
    }

    @IBAction func nextTouchUpInside(_ sender: Any) {
        let viewControllerE = ViewControllerE()
        self.navigationController?.pushViewController(viewControllerE, animated: true)
    }
    @IBAction func nextCTouchUpInside(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func nextBTouchUpInside(_ sender: Any) {
        guard let viewControllerB = self.navigationController?.viewControllers.first(where: { $0 is ViewControllerB }) else { return }
        self.navigationController?.popToViewController(viewControllerB, animated: true)
    }

    @IBAction func rootTouchUpInside(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
