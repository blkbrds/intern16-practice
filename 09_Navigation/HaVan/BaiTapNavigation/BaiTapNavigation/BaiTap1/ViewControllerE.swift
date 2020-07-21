//
//  ViewControllerE.swift
//  BaiTapNavigation
//
//  Created by NganHa on 7/21/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

final class ViewControllerE: UIViewController {
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ViewControllerE"
    }
    
    // MARK: - IBActions
    @IBAction private func CButtonTouchUpInside(_ sender: UIButton) {
       guard let viewControllerC = navigationController?.viewControllers.first(where: {$0 is ViewControllerC}) else { return }
        navigationController?.popToViewController(viewControllerC, animated: true)
    }
    @IBAction private func BButtonTouchUpInside(_ sender: UIButton) {
        guard let viewControllerB = navigationController?.viewControllers.first(where: {$0 is ViewControllerB}) else { return }
        navigationController?.popToViewController(viewControllerB, animated: true)
    }
    
    @IBAction private func DButtonTouchUpInside(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction private func rootButtonTouchUpInside(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
}
