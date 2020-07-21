//
//  ViewControllerB.swift
//  BaiTapNavigation
//
//  Created by NganHa on 7/21/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

final class ViewControllerB: UIViewController {

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ViewControllerB"
    }

    // MARK: - IBActions
    @IBAction private func nextButtonTouchUpInside(_ sender: UIButton) {
        let viewControllerC = ViewControllerC()
        navigationController?.pushViewController(viewControllerC, animated: true)
    }
    
    @IBAction private func preButtonTouchUpInside(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}
