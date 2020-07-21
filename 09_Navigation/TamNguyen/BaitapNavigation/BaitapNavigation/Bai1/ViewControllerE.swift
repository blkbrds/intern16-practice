//
//  ViewControllerE.swift
//  BaitapNavigation
//
//  Created by PCI0001 on 7/21/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

final class ViewControllerE: UIViewController {
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ViewController E"
    }
    // MARK: - IBActions
    @IBAction private func popRootTouchUpInside(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func popBControllerTouchUpInside(_ sender: UIButton) {
        guard let vc = navigationController?.viewControllers.first(where: { $0 is ViewControllerB }) else { return }
        navigationController?.popToViewController(vc, animated: true)
    }
    
    @IBAction func popCControllerTouchUpInside(_ sender: UIButton) {
        guard let vc = navigationController?.viewControllers.first(where: { $0 is ViewControllerC }) else { return }
        navigationController?.popToViewController(vc, animated: true)
    }
    
    @IBAction func popDControllerTouchUpInside(_ sender: UIButton) {
        guard let vc = navigationController?.viewControllers.first(where: { $0 is ViewControllerD }) else { return }
        navigationController?.popToViewController(vc, animated: true)
    }
}
