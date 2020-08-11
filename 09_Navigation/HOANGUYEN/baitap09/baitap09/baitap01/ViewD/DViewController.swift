//
//  DViewController.swift
//  baitap09
//
//  Created by NXH on 7/15/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

class DViewController: UIViewController {

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "View Controller D"
    }
    
    // MARK: - IBACtion
    @IBAction private func nextButtonTouchUpInside(_ sender: UIButton) {
        let eController = EViewController()
        navigationController?.pushViewController(eController, animated: true)
    }
    
    @IBAction private func cButtonTouchUpInside(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction private func bButtonTouchUpInside(_ sender: UIButton) {
        let view = navigationController?.viewControllers
        guard let viewCheck = view?.first(where: {$0 is BViewController } ) else { return }
        navigationController?.popToViewController(viewCheck, animated: true)
    }
    @IBAction private func rootButtonTouchUpInside(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
}
