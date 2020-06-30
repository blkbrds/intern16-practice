//
//  ChangeClolorViewController.swift
//  Gioi Thieu
//
//  Created by PCI0007 on 6/23/20.
//  Copyright © 2020 PCI0007. All rights reserved.
//

import UIKit

let button: UIButton = UIButton()

class ChangeClolorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.backgroundColor = random()
        showButton()
       
        }

    
   func random() -> UIColor {
        return UIColor(red: .random(in: 0...1),
                      green: .random(in: 0...1),
                      blue: .random(in: 0...1),
                      alpha: 1.0)
   }


    let changeColor : UIButton = {
        var button1 = UIButton()
            button1.translatesAutoresizingMaskIntoConstraints = false
            button1.layer.cornerRadius = 10
            button1.setTitle("Tap", for: .normal)
            button1.setTitleColor(.black, for: .normal)
            button1.backgroundColor = .white
            button1.addTarget(self, action: #selector(RandomColor), for: .touchUpInside)
        
            return button1
        }()

    func showButton(){
        view.addSubview(changeColor)
        let button1contrains = [
        changeColor.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
        changeColor.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0),
        changeColor.heightAnchor.constraint(equalToConstant: 60),
        changeColor.widthAnchor.constraint(equalToConstant: 150)
        ]
        NSLayoutConstraint.activate(button1contrains)
    }
    @objc func RandomColor(){
        view.backgroundColor = random()
    }
    
    
    
    
    
    
    
    
    
}
