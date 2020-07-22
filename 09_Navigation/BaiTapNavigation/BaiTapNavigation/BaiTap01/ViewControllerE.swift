//
//  ViewControllerE.swift
//  BaiTapNavigation
//
//  Created by PCI0004 on 7/21/20.
//  Copyright © 2020 PCI0004. All rights reserved.
//

import UIKit

class ViewControllerE: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var viewControllerB: UIButton!
    @IBOutlet private weak var viewControllerC: UIButton!
    @IBOutlet private weak var viewControllerD: UIButton!
    @IBOutlet private weak var rootButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "View Controller E"
    }

    @IBAction func nextBTouchUpInside(_ sender: Any) {
        guard let viewControllerB = navigationController?.viewControllers.first(where: { $0 is ViewControllerB }) else { return }
        self.navigationController?.popToViewController(viewControllerB, animated: true)

    }
    @IBAction func nextCTouchUpInside(_ sender: Any) {
        guard let viewControllerC = navigationController?.viewControllers.first(where: { $0 is ViewControllerC }) else { return }
        self.navigationController?.popToViewController(viewControllerC, animated: true)
    }
    @IBAction func nextDTouchUpInside(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func rootTouchUpInside(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
