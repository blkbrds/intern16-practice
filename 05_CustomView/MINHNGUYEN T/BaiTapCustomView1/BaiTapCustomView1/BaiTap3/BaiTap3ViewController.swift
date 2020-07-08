
//
//  BaiTap4ViewController.swift
//  BaiTapCustomView1
//
//  Created by MacBook Pro on 7/6/20.
//  Copyright © 2020 asiantech. All rights reserved.
//
import UIKit

class BaiTap3ViewController: UIViewController {
    
    //MARK: - Private Properties
    private let button = BagdeNumberButton()
    private let button1 = BagdeNumberButton()

    // MARK: - Life Cycle
    override func viewDidLoad() {
        setupUIButton()
    }

    // MARK: - Private Function
    private func setupUIButton() {
        button1.frame = CGRect(x: 100, y: 150, width: 150, height: 70)
        button1.isShowBadge = true
        button1.badgeNumber = 100
        button1.layer.cornerRadius = 10
        button1.backgroundColor = .red
        button1.setTitle("Photos", for: .normal)
        button1.editPositionBagde(position: .topRight)
        view.addSubview(button1)
        
        button.frame = CGRect(x: 50, y: 250, width: 150, height: 70)
        button.isShowBadge = true
        button.badgeNumber = 22
        button.layer.cornerRadius = 10
        button.backgroundColor = .gray
        button.setTitle("Photos", for: .normal)
        button.editPositionBagde(position: .topLeft)
        view.addSubview(button)
    }
}
