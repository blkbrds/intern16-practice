//
//  ViewControllerD.swift
//  BaiTapNavigation
//
//  Created by NganHa on 7/21/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

final class ViewControllerD: UIViewController {
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ViewControllerD"
    }
    
    // MARK: - IBActions
    @IBAction private func nextButtonTouchUpInside(_ sender: UIButton) {
        let viewControllerE = ViewControllerE()
        navigationController?.pushViewController(viewControllerE, animated: true)
    }
    
    @IBAction private func CButtonTouchUpInside(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction private func BButtonTouchUpInside(_ sender: UIButton) {
        guard let viewControllerB = navigationController?.viewControllers[1] else {
            return
        }
        navigationController?.popToViewController(viewControllerB, animated: true)
    }
    
    @IBAction private func rootButtonTouchUpInside(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    
}
