//
//  Bai3ViewController.swift
//  Bai5
//
//  Created by PCI0001 on 7/6/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

class Bai3ViewController: UIViewController {
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configButton()
    }
    
    // MARK: - Private functions
    private func configButton() {
        let emaillButton = CustomView(frame: CGRect(x: 100, y: 50, width: 150, height: 60), number: 50, position: .TopLeft, nameButton: "Email")
        view.addSubview(emaillButton)
        
        let friendButton = CustomView(frame: CGRect(x: 100, y: 200, width: 150, height: 60), number: 50, position: .CenterRight, nameButton: "Friends")
        view.addSubview(friendButton)
        
        let photoButton = CustomView(frame: CGRect(x: 100, y: 350, width: 150, height: 60), number: 100, position: .TopCenter, nameButton: "Photos")
        view.addSubview(photoButton)
    }
}
