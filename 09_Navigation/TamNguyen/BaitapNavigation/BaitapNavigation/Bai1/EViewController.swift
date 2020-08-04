//
//  ViewControllerE.swift
//  BaitapNavigation
//
//  Created by PCI0001 on 7/21/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

final class EViewController: UIViewController {
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ViewController E"
    }
    
    // MARK: - IBActions
    @IBAction private func popRootButtonTouchUpInside(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction private func popBControllerButtonTouchUpInside(_ sender: UIButton) {
        guard let vc = navigationController?.viewControllers.first(where: { $0 is BViewController }) else { return }
        navigationController?.popToViewController(vc, animated: true)
    }
    
    @IBAction private func popCControllerButtonTouchUpInside(_ sender: UIButton) {
        guard let vc = navigationController?.viewControllers.first(where: { $0 is CViewController }) else { return }
        navigationController?.popToViewController(vc, animated: true)
    }
    
    @IBAction private func popDControllerButtonTouchUpInside(_ sender: UIButton) {
        guard let vc = navigationController?.viewControllers.first(where: { $0 is DViewController }) else { return }
        navigationController?.popToViewController(vc, animated: true)
    }
}
