//
//  ViewControllerD.swift
//  BaitapNavigation
//
//  Created by PCI0001 on 7/21/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

final class ViewControllerD: UIViewController {
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ViewController D"
    }
    
    // MARK: - IBActions
    @IBAction private func pushViewTouchUpInside(_sender: UIButton) {
        let nextView = ViewControllerE()
        navigationController?.pushViewController(nextView, animated: true)
    }
    
    @IBAction private func popRootTouchUpInside(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction private func popControllerTouchUpInside(_ sender: UIButton) {
        guard let vc = navigationController?.viewControllers.first(where: { $0 is ViewControllerB }) else { return }
        navigationController?.popToViewController(vc, animated: true)
    }
    
    @IBAction private func popCControllerTouchUpInside(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
