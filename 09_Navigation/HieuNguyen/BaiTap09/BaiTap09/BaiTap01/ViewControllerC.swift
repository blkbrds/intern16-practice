//
//  ViewControllerC.swift
//  BaiTap09
//
//  Created by hieungq on 7/8/20.
//  Copyright © 2020 hieungq. All rights reserved.
//

import UIKit

class ViewControllerC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "ViewController C"
     
    }

    @IBAction func nextButtonTouchUpInside(_ sender: Any) {
        let ctrlD = ViewControllerD()
        navigationController?.pushViewController(ctrlD, animated: true)
    }
    
    @IBAction func preButtonTouchUpInside(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func rootButtonTouchUpInside(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }

}
