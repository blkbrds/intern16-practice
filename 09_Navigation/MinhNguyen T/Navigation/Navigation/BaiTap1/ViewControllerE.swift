//
//  ViewControllerE.swift
//  Navigation
//
//  Created by MacBook Pro on 7/21/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class ViewControllerE: UIViewController {

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ViewController E"
    }

    // MARK: - IBActions
    @IBAction private func rootView(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }

    @IBAction private func viewCView(_ sender: UIButton) {
        let viewB = ViewControllerC()
        self.navigationController?.pushViewController(viewB, animated: true)
    }

    @IBAction private func viewBView(_ sender: UIButton) {
        let viewB = ViewControllerB()
        self.navigationController?.pushViewController(viewB, animated: true)
    }

    @IBAction private func viewDView(_ sender: UIButton) {
        let viewB = ViewControllerD()
        self.navigationController?.pushViewController(viewB, animated: true)
    }
}
