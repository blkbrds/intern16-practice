//
//  ViewControllerC.swift
//  Navigation
//
//  Created by MacBook Pro on 7/21/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class ViewControllerC: UIViewController {

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ViewController C"
    }

    // MARK: - IBActions
    @IBAction private func pushViewTouchUpInside(_ sender: UIButton) {
        let nextVC = ViewControllerD()
        navigationController?.pushViewController(nextVC, animated: true)
    }

    @IBAction private func popViewTouchUpInSide(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }

    @IBAction private func rootViewTouchUpInSide(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
}
