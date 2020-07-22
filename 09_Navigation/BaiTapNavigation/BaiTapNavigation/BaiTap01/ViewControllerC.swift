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

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "View Controller C"
    }

    @IBAction func nextTouchUpInside(_ sender: Any) {
        let viewControllerD = ViewControllerD()
        self.navigationController?.pushViewController(viewControllerD, animated: true)
    }

    @IBAction func previousTouchUpInside(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func rootTouchUpInside(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }

}
