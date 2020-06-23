//
//  ViewController.swift
//  BaiTap01
//
//  Created by PCI0004 on 6/23/20.
//  Copyright © 2020 PCI0004. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = random()
        
        //nut tap
        let button = UIButton(frame: CGRect(x: 140, y: 300, width: 100, height: 50))
        button.backgroundColor = .white
        button.setTitle("Tap", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.addTarget(self,action: #selector(RandomColor), for: .touchUpInside)
        self.view.addSubview(button)
    }
    
    func random() -> UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 1.0)
    }
    
    @objc func RandomColor(){
        view.backgroundColor = random()
    }
}
