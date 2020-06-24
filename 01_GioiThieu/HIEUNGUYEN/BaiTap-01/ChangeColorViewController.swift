//
//  ChangeColorViewController.swift
//  BaiTap-01
//
//  Created by PCI0020 on 6/23/20.
//  Copyright © 2020 hieu.ngq. All rights reserved.
//

import UIKit

class ChangeColorViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = random()
        setupButton()
        // Do any additional setup after loading the view.
    }
    func random() -> UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 1.0)
    }
    let changeColorBtn : UIButton = {
        var btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 5
        btn.layer.masksToBounds = true
        
        btn.setTitle("Change Color", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .white
        btn.addTarget(self, action: #selector(RandomColor), for: .touchUpInside)
        
        return btn
    }()
    func setupButton(){
        view.addSubview(changeColorBtn)
        let btncontrains = [
            changeColorBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            changeColorBtn.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0),
            changeColorBtn.heightAnchor.constraint(equalToConstant: 64),
            changeColorBtn.widthAnchor.constraint(equalToConstant: 128)
        ]
        NSLayoutConstraint.activate(btncontrains)
    }
    @objc func RandomColor(){
        view.backgroundColor = random()
    }
    
}
