//
//  BaiTap2ViewController.swift
//  BaiTapDrawing
//
//  Created by NganHa on 7/9/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

final class BaiTap2ViewController: UIViewController {

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let circle = CircleGraphic(frame: CGRect(x: 10, y: 100, width: 300, height: 300), percent: 60)
        view.addSubview(circle)
    }

}
