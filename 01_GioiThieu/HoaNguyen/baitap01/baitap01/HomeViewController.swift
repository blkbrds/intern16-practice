//
//  HomeViewController.swift
//  baitap01
//
//  Created by NXH on 6/23/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    let btn_Switch:UIButton = {
        let btn:UIButton = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Tap", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .white
        btn.layer.borderWidth = 3
        btn.layer.cornerRadius = 10
        btn.layer.borderColor = UIColor.blue.cgColor
        return btn
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in:0...1), blue: CGFloat.random(in:0...1), alpha: 1)
        view.addSubview(btn_Switch)
        btn_Switch.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        btn_Switch.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        btn_Switch.heightAnchor.constraint(equalToConstant: 50).isActive = true
        btn_Switch.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        btn_Switch.addTarget(self, action: #selector(touchOnButton(_btn:)), for: UIControl.Event.touchUpInside)
        
    }
    @objc func touchOnButton(_btn:UIButton){
        view.backgroundColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in:0...1), blue: CGFloat.random(in:0...1), alpha: 1)

    }
    
}
