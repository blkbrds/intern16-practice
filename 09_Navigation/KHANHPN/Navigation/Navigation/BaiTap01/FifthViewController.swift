//
//  FifthView.swift
//  Navigation
//
//  Created by PCI0007 on 7/16/20.
//  Copyright © 2020 Chipuscu. All rights reserved.
//

import UIKit

final class FifthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Fifth View"
    }
    
    @IBAction func push(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            guard let second = (navigationController?.viewControllers.first(where: {$0 is SecondViewController} )) else {return}
            self.navigationController?.popToViewController(second, animated: true)
        case 2:
            guard let third = (navigationController?.viewControllers.first(where: {$0 is ThirdViewController} )) else {return}
            self.navigationController?.popToViewController(third, animated: true)
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
