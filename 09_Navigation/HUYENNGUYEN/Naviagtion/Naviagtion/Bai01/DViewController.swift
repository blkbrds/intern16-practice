//
//  DViewController.swift
//  Naviagtion
//
//  Created by bu on 7/21/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

class DViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ViewController D"
    }
    
    @IBAction func nextButtonAction(_ sender: Any) {
        let eViewController = EViewController()
        navigationController?.pushViewController(eViewController, animated: true)
    }
    @IBAction func cButtonAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func bButtonAction(_ sender: Any) {
        let bViewController = (self.navigationController?.viewControllers[1])!
        self.navigationController?.popToViewController(bViewController, animated: true)
    }
    @IBAction func rootButtonAction(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}
