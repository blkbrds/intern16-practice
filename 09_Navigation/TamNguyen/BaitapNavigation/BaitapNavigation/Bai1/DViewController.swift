//
//  ViewControllerD.swift
//  BaitapNavigation
//
//  Created by PCI0001 on 7/21/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

final class DViewController: UIViewController {
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ViewController D"
    }
    
    // MARK: - IBActions
    @IBAction private func pushViewButtonTouchUpInside(_sender: UIButton) {
        let nextView = EViewController()
        navigationController?.pushViewController(nextView, animated: true)
    }
    
    @IBAction private func popRootButtonTouchUpInside(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction private func popControllerButtonTouchUpInside(_ sender: UIButton) {
        guard let vc = navigationController?.viewControllers.first(where: { $0 is BViewController }) else { return }
        navigationController?.popToViewController(vc, animated: true)
    }
    
    @IBAction private func popCControllerButtonTouchUpInside(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
