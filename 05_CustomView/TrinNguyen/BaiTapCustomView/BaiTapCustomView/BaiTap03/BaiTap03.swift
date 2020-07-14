//
//  BaiTap03.swift
//  BaiTapCustomView
//
//  Created by PCI0004 on 7/7/20.
//  Copyright © 2020 PCI0004. All rights reserved.
//

import UIKit

final class BaiTap03: UIViewController {

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let myButton = MyButton(frame: CGRect(x: 120, y: 150, width: 170, height: 100), index: .topRight, number: 100, name: "Email")
        myButton.backgroundColor = .green
        self.view.addSubview(myButton)

        let myButton1 = MyButton(frame: CGRect(x: 120, y: 350, width: 170, height: 100), index: .centerTop, number: 30, name: "Friend")
        myButton1.backgroundColor = .yellow
        self.view.addSubview(myButton1)

        let myButton2 = MyButton(frame: CGRect(x: 120, y: 550, width: 170, height: 100), index: .bottomLeft, number: 30, name: "Photo")
        myButton2.backgroundColor = .purple
        self.view.addSubview(myButton2)
    }



}
