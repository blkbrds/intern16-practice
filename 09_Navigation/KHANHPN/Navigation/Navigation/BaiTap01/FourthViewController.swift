//
//  FourthView.swift
//  Navigation
//
//  Created by PCI0007 on 7/16/20.
//  Copyright © 2020 Chipuscu. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Fourth View"
    }

    @IBAction func push(_ sender: UIButton) {
        switch sender.tag {
        case 1:
             let next = FifthViewController()
            self.navigationController?.pushViewController(next, animated: true)
        case 2:
            guard let second = (navigationController?.viewControllers.first(where: {$0 is SecondViewController} )) else {return}
            self.navigationController?.popToViewController(second, animated: true)
        case 3:
            self.navigationController?.popViewController(animated: true)
        default:
            return
        }
    }

    @IBAction func popRoot(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
