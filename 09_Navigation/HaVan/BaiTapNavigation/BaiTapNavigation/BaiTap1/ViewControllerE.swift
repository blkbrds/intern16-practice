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
    
    @IBAction func CButtonTouchUpInside(_ sender: UIButton) {
        guard let viewControllerC = navigationController?.viewControllers[2] else { return }
        navigationController?.popToViewController(viewControllerC, animated: true)
    }
    @IBAction func BButtonTouchUpInside(_ sender: UIButton) {
        guard let viewControllerB = navigationController?.viewControllers[1] else { return }
        navigationController?.popToViewController(viewControllerB, animated: true)
    }
    
    @IBAction func DButtonTouchUpInside(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func rootButtonTouchUpInside(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
}
