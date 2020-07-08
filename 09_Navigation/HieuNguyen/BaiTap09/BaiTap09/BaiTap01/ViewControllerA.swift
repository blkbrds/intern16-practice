//
//  ViewControllerA.swift
//  BaiTap09
//
//  Created by hieungq on 7/8/20.
//  Copyright © 2020 hieungq. All rights reserved.
//

import UIKit

class ViewControllerA: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ViewController A"
        view.backgroundColor = .white
    }

    @IBAction func nextButtonTouchUpInside(_ sender: Any) {
        let viewControllerB = ViewControllerB()
        navigationController?.pushViewController(viewControllerB, animated: true)
    }
}
