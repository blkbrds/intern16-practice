//
//  ViewControllerB.swift
//  Navigation
//
//  Created by MacBook Pro on 7/20/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class ViewControllerB: UIViewController {

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ViewController B"
    }

    // MARK: - IBActions
    @IBAction private func pushViewTouchUpInside(_ sender: UIButton) {
        let nextVC = ViewControllerC()
        navigationController?.pushViewController(nextVC, animated: true)
    }

    @IBAction private func popViewTouchUpInside(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
