//
//  MyViewController.swift
//  Baitap01
//
//  Created by MBA0245P on 6/23/20.
//  Copyright © 2020 Tran Thao Nguyen. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func getRandomColor() -> UIColor {
         //Generate between 0 to 1
         let red:CGFloat = CGFloat(drand48())
         let green:CGFloat = CGFloat(drand48())
         let blue:CGFloat = CGFloat(drand48())

         return UIColor(red:red, green: green, blue: blue, alpha: 1.0)
    }
    
    @IBAction func RandomColorTouchUpInside(_ sender: Any) {
        self.view.backgroundColor = getRandomColor()
    }
    
}
