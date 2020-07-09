//
//  BaiTap3ViewController.swift
//  BaiTapCustomVIew
//
//  Created by NganHa on 7/6/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

final class BaiTap3ViewController: UIViewController {
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configButton()
    }
    
    // MARK: - Private functions
    private func configButton() {
        let firstButton = MyButtonView(frame: CGRect(x: 100, y: 50, width: 150, height: 60), number: 50, position: .TopLeft, nameButton: "Hello")
        view.addSubview(firstButton)
        let secondButton = MyButtonView(frame: CGRect(x: 100, y: 150, width: 150, height: 60), number: 50, position: .CenterRight, nameButton: "hi")
        view.addSubview(secondButton)
        let thirdButton = MyButtonView(frame: CGRect(x: 100, y: 250, width: 150, height: 60), number: 100, position: .TopCenter, nameButton: "bye")
        view.addSubview(thirdButton)
    }
}
