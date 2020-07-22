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
        let nextUi = ViewControllerE()
        self.navigationController?.pushViewController(nextUi, animated: true)
    }

    @IBAction private func backToViewCTCouchUpInside(_ sender: UIButton) {
        guard let viewPrevious = navigationController?.viewControllers.first(where: {$0 is ViewControllerC}) else { return }
        self.navigationController?.popToViewController(viewPrevious, animated: true)
    }

    @IBAction private func rootViewTouchUpInside(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }

    @IBAction private func backViewBTouchUpInside(_ sender: UIButton) {
     
        guard let viewPrevious = navigationController?.viewControllers.first(where: {$0 is ViewControllerB}) else { return }
        self.navigationController?.popToViewController(viewPrevious, animated: true)
    }
}
