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
    @IBAction private func pushView(_ sender: UIButton) {
        let nextUi = ViewControllerD()
        self.navigationController?.pushViewController(nextUi, animated: true)
    }

    @IBAction private func popView(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction private func rootView(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
