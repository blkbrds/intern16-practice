//
//  ViewControllerC.swift
//  BaiTapNavigation
//
//  Created by NganHa on 7/21/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

final class ViewControllerC: UIViewController {

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ViewControllerC"
    }
    
    // MARK: - IBActions
    @IBAction private func nextButtonTouchUpInside(_ sender: UIButton) {
        let viewControllerD = ViewControllerD()
        navigationController?.pushViewController(viewControllerD, animated: true)
    }
    @IBAction private func preButtonTouchUpInside(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction private func rootButtonTouchUpInside(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    
}
