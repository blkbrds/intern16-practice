//
//  EViewController.swift
//  Baitap9Navigation
//
//  Created by MBA0245P on 9/2/20.
//  Copyright © 2020 Tran Thao Nguyen. All rights reserved.
//

import UIKit

class EViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "ViewController E"
    }
    @IBAction func cButtonTouchUpInside(_ sender: UIButton) {
        guard let viewControllerC = navigationController?.viewControllers.first(where: { $0 is CViewController }) else { return }
        navigationController?.popToViewController(viewControllerC, animated: true)
    }
    
    @IBAction func bButtonTouchUpInside(_ sender: UIButton) {
        guard let viewControllerB = navigationController?.viewControllers.first(where: { $0 is BViewController }) else { return }
        navigationController?.popToViewController(viewControllerB, animated: true)
    }
    
    @IBAction func dButtonTouchUpInside(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func rootButtonTouchUpInside(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    


}
