//
//  Baitap2ViewController.swift
//  Baitap5
//
//  Created by MBA0245P on 7/18/20.
//  Copyright © 2020 Tran Thao Nguyen. All rights reserved.
//

import UIKit

class Baitap2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let frame = CGRect(x: 100, y: 200, width: 200, height: 500)
        let triangleView = CustomSiderView(frame: frame)
        view.addSubview(triangleView)
    }

    

}
