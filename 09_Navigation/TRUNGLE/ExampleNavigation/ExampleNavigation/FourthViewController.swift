//
//  FourthViewController.swift
//  ExampleNavigation
//
//  Created by Trung Le D. on 7/21/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Viewcontroller D"
        // Do any additional setup after loading the view.
    }
    @IBAction func push(_ sender: Any) {
        self.navigationController?.pushViewController(FiveThViewController(), animated: true)
    }
    @IBAction func returnThirdVC(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func returnSecondVC(_ sender: Any) {
        let vc = (self.navigationController?.viewControllers[1])!
           self.navigationController?.popToViewController(vc, animated: true)
    }
    
    @IBAction func returnRoot(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
