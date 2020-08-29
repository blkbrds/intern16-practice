//
//  BaiTap03.swift
//  CustomView
//
//  Created by PCI0007 on 7/6/20.
//  Copyright © 2020 Chipuscu. All rights reserved.
//

import UIKit

final class BaiTap03: UIViewController {
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Private function
    private func setupView() {
        let button1 = CustomButton(frame: CGRect(x: 100, y: 200, width: 200, height: 100), number: 69, colorButon: .systemGreen, position: .topRight, name: "Email")
        self.view.addSubview(button1)
        
        let button2 = CustomButton(frame: CGRect(x: 100, y: 400, width: 200, height: 100), number: 8, colorButon: .systemYellow, position: .topCenter, name: "Photos")
        self.view.addSubview(button2)
        
        let button3 = CustomButton(frame: CGRect(x: 100, y: 600, width: 200, height: 100), number: 100, colorButon: .systemPurple, position: .topLeft, name: "Friends")
        self.view.addSubview(button3)
    }
}
