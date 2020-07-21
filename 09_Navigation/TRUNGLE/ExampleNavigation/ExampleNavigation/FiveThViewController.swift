//
//  FiveThViewController.swift
//  ExampleNavigation
//
//  Created by Trung Le D. on 7/21/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import UIKit

class FiveThViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ViewController E"
      
    }
    @IBAction func returnCVC(_ sender: Any) {
        self.navigationController?.popToViewController((navigationController?.viewControllers[2])!, animated: true)
    }
    
    @IBAction func returnBVc(_ sender: Any) {
        self.navigationController?.popToViewController((navigationController?.viewControllers[1])!, animated: true)
    }
    @IBAction func returnDVC(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func returnRoot(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}
