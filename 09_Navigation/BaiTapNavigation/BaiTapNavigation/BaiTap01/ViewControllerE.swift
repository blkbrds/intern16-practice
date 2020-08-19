//
//  ViewControllerE.swift
//  BaiTapNavigation
//
//  Created by PCI0004 on 7/21/20.
//  Copyright © 2020 PCI0004. All rights reserved.
//

import UIKit

class ViewControllerE: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var viewControllerB: UIButton!
    @IBOutlet private weak var viewControllerC: UIButton!
    @IBOutlet private weak var viewControllerD: UIButton!
    @IBOutlet private weak var rootButton: UIButton!

    // MARK: - Configure
    private struct Configure {
        static let titleName = "View Controller E"
    }
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Configure.titleName
    }

    // MARK: - IBAction
    @IBAction private func nextBTouchUpInside(_ sender: Any) {
        guard let viewControllerB = navigationController?.viewControllers.first(where: { $0 is ViewControllerB }) else { return }
        navigationController?.popToViewController(viewControllerB, animated: true)
    }
    
    @IBAction private func nextCTouchUpInside(_ sender: Any) {
        guard let viewControllerC = navigationController?.viewControllers.first(where: { $0 is ViewControllerC }) else { return }
        navigationController?.popToViewController(viewControllerC, animated: true)
    }
    
    @IBAction private func nextDTouchUpInside(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction private func rootTouchUpInside(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}
