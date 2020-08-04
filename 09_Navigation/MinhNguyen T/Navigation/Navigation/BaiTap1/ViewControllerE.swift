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
    @IBAction private func rootViewTouchUpInside(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }

    @IBAction private func backToCViewTouchUpInside(_ sender: UIButton) {
        guard let previousView = navigationController?.viewControllers.first(where: {$0 is ViewControllerC}) else { return }
        navigationController?.popToViewController(previousView, animated: true)
    }

    @IBAction private func backToViewBTouchUpInside(_ sender: UIButton) {
        guard let previousView = navigationController?.viewControllers.first(where: {$0 is ViewControllerB}) else { return }
        navigationController?.popToViewController(previousView, animated: true)
    }

    @IBAction private func backToViewDTouchUpInside(_ sender: UIButton) {
        guard let previousView = navigationController?.viewControllers.first(where: {$0 is ViewControllerD}) else { return }
        navigationController?.popToViewController(previousView, animated: true)
    }
}
