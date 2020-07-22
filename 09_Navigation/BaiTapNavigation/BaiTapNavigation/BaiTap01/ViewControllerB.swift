//
//  ViewControllerB.swift
//  BaiTapNavigation
//
//  Created by PCI0004 on 7/21/20.
//  Copyright © 2020 PCI0004. All rights reserved.
//

import UIKit

final class ViewControllerB: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var nextButton: UIButton!
    @IBOutlet private weak var previousButton: UIButton!

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "View Controller B"
    }

    // MARK: IBActions
    @IBAction func pushTouchUpInside(_ sender: Any) {
        let viewControllerC = ViewControllerC()
        self.navigationController?.pushViewController(viewControllerC, animated: true)
    }
    @IBAction func popTouchUpInside(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

}
