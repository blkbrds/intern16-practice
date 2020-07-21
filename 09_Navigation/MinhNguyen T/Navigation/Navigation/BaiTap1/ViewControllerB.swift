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
    @IBAction private func pushView(_ sender: UIButton) {
        let nextUi = ViewControllerC()
        self.navigationController?.pushViewController(nextUi, animated: true)
    }

    @IBAction private func popView(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
