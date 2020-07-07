//
//  Bai3ViewController.swift
//  Bai5
//
//  Created by PCI0001 on 7/6/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

class Bai3ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createButton()
        // Do any additional setup after loading the view.
    }
    
    private func createButton() {
        let emailButton: CustomView = CustomView(origin: CGPoint(x: 150, y: 50), numberBadge: 4)
            //emailButton.setBadge(loc: "Top-Right")
            emailButton.button.setTitle("Email", for: .normal)
            emailButton.button.backgroundColor = .green
        let friendButton: CustomView = CustomView(origin: CGPoint(x: 150,y : 175), numberBadge: 60)
        friendButton.button.setTitle("Friends", for: .normal)
        friendButton.button.backgroundColor = .red
        let photoButton: CustomView = CustomView(origin: CGPoint(x: 150,y : 300), numberBadge: 60)
        photoButton.button.setTitle("Friends", for: .normal)
        photoButton.button.backgroundColor = .blue
            
        view.addSubview(emailButton)
        view.addSubview(friendButton)
        view.addSubview(photoButton)
    }

    
}
