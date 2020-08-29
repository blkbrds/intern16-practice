//
//  ThirdView.swift
//  Navigation
//
//  Created by PCI0007 on 7/16/20.
//  Copyright © 2020 Chipuscu. All rights reserved.
//

import UIKit

final class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Third View"
    }
    
    @IBAction func pushVC(_ sender: UIButton) {
        let next = FourthViewController()
            self.navigationController?.pushViewController(next, animated: true)
    }
    
    @IBAction func popVC(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func popRoot(_ sender: Any) {
            self.navigationController?.popToRootViewController(animated: true)
        }
}
