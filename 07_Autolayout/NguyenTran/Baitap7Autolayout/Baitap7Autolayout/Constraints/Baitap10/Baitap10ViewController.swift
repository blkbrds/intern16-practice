//
//  Baitap10ViewController.swift
//  Baitap7Autolayout
//
//  Created by MBA0245P on 8/26/20.
//  Copyright © 2020 Tran Thao Nguyen. All rights reserved.
//

import UIKit

class Baitap10ViewController: UIViewController {
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var view1WidthLayoutConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var view2WidthLayoutConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var view3WidthLayoutConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var view4WidthLayoutConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view1.isUserInteractionEnabled = true
        view2.isUserInteractionEnabled = true
        view3.isUserInteractionEnabled = true
        view4.isUserInteractionEnabled = true
        let tapOnView1 = UITapGestureRecognizer(target: self, action: #selector(tapView1))
        view1.addGestureRecognizer(tapOnView1)
        let tapOnView2 = UITapGestureRecognizer(target: self, action: #selector(tapView2))
        view2.addGestureRecognizer(tapOnView2)
        let tapOnView3 = UITapGestureRecognizer(target: self, action: #selector(tapView3))
        view3.addGestureRecognizer(tapOnView3)
        let tapOnView4 = UITapGestureRecognizer(target: self, action: #selector(tapView4))
        view4.addGestureRecognizer(tapOnView4)
        
    }
    
    @objc func tapView1() {
        if view1WidthLayoutConstraint.constant == 100 {
            view1WidthLayoutConstraint.constant = 200
            view2WidthLayoutConstraint.constant = 100
            view3WidthLayoutConstraint.constant = 100
            view4WidthLayoutConstraint.constant = 100
        }
    }
    
    @objc func tapView2() {
        if view2WidthLayoutConstraint.constant == 100 {
            view2WidthLayoutConstraint.constant = 200
            view1WidthLayoutConstraint.constant = 100
            view3WidthLayoutConstraint.constant = 100
            view4WidthLayoutConstraint.constant = 100
        }
    }
    
    @objc func tapView3() {
        if view3WidthLayoutConstraint.constant == 100 {
            view3WidthLayoutConstraint.constant = 200
            view1WidthLayoutConstraint.constant = 100
            view2WidthLayoutConstraint.constant = 100
            view4WidthLayoutConstraint.constant = 100
        }
    }
    
    @objc func tapView4() {
        if view4WidthLayoutConstraint.constant == 100 {
            view4WidthLayoutConstraint.constant = 200
            view1WidthLayoutConstraint.constant = 100
            view2WidthLayoutConstraint.constant = 100
            view3WidthLayoutConstraint.constant = 100
        }
    }


}
