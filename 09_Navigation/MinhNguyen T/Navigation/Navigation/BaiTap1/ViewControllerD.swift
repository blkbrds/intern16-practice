//
//  ViewControllerD.swift
//  Navigation
//
//  Created by MacBook Pro on 7/21/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class ViewControllerD: UIViewController {

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ViewController D"
    }

    // MARK: - IBActions
    @IBAction private func pushViewTouchUpInside(_ sender: UIButton) {
        let nextVC = ViewControllerE()
        navigationController?.pushViewController(nextVC, animated: true)
    }

    @IBAction private func backToViewCTCouchUpInside(_ sender: UIButton) {
        guard let previousView = navigationController?.viewControllers.first(where: {$0 is ViewControllerC}) else { return }
        navigationController?.popToViewController(previousView, animated: true)
    }

    @IBAction private func rootViewTouchUpInside(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }

    @IBAction private func backViewBTouchUpInside(_ sender: UIButton) {
        guard let previousView = navigationController?.viewControllers.first(where: {$0 is ViewControllerB}) else { return }
        navigationController?.popToViewController(previousView, animated: true)
    }
}
