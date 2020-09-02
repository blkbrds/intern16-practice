//
//  DViewController.swift
//  Baitap9Navigation
//
//  Created by MBA0245P on 9/2/20.
//  Copyright © 2020 Tran Thao Nguyen. All rights reserved.
//

import UIKit

class DViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "ViewController D"
        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: nil)
        navigationItem.backBarButtonItem = backButton
    }
    @IBAction func nextButtonTouchUpInside(_ sender: Any) {
        let viewControllerE = EViewController()
        navigationController?.pushViewController(viewControllerE, animated: true)
    }
    
    @IBAction func cButtonTouchUpInside(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func bButtonTouchUpInside(_ sender: UIButton) {
        guard let viewControllerB = navigationController?.viewControllers.first(where: { $0 is BViewController }) else { return }
        navigationController?.popToViewController(viewControllerB, animated: true)
    }
    
    @IBAction func rootButtonTouchUpInside(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}
