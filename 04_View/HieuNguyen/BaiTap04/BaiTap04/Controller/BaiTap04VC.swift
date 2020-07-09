//
//  BaiTap04.swift
//  BaiTap04
//
//  Created by hieungq on 6/29/20.
//  Copyright © 2020 hieungq. All rights reserved.
//

import UIKit

class BaiTap04VC: UIViewController {

    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var resultView: UIView!
    @IBOutlet weak var slideRed: UISlider!
    @IBOutlet weak var slideGreen: UISlider!
    @IBOutlet weak var slideBlue: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.6612372971, green: 0.8392673981, blue: 0.7043904049, alpha: 1)
    }

    @IBAction func slideAction(_ sender: Any) {
        let colorRed = CGFloat(slideRed.value)
        let colorGreen = CGFloat(slideGreen.value)
        let colorBlue = CGFloat(slideBlue.value)
        resultView.backgroundColor = UIColor(red: colorRed / 255, green: colorGreen / 255, blue: colorBlue / 255, alpha: 1.0)
        colorLabel.text = "Color( R: \(Int(colorRed)), G: \(Int(colorGreen)), B: \(Int(colorBlue)))"
    }
}
