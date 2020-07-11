//
//  Baitap03ViewController.swift
//  baitap05
//
//  Created by NXH on 7/3/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

class Baitap03ViewController: UIViewController {
 
// MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        creatButtons()
    }
    
// MARK: - Private function
    private func creatButtons() {
        let emailButton: CustomButton = CustomButton(origin: CGPoint(x: 150, y: 50), numberOfBadge: 4)
        emailButton.setBadge(location: .bottomLeft)
        emailButton.button.setTitle("Email", for: .normal)
        emailButton.button.backgroundColor = .green
        let friendsButton: CustomButton = CustomButton(origin: CGPoint(x: 150, y: 150), numberOfBadge: 244)
        friendsButton.setBadge(location: .topRight)
        friendsButton.button.setTitle("Friends", for: .normal)
        let photosButton: CustomButton = CustomButton(origin: CGPoint(x: 150, y: 250), numberOfBadge: 0)
        photosButton.setBadge(location: .topLeft)
        photosButton.button.setTitle("Photos", for: .normal)
        photosButton.button.backgroundColor = .blue
        view.addSubview(emailButton)
        view.addSubview(friendsButton)
        view.addSubview(photosButton)
    }
}

