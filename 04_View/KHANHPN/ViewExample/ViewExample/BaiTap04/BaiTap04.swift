//
//  BaiTap04.swift
//  ViewExample
//
//  Created by PCI0007 on 7/1/20.
//  Copyright © 2020 Chipuscu. All rights reserved.
//

import UIKit

final class BaiTap04: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var colorText: UILabel!
    
    @IBOutlet weak var slideRed: UISlider!
    
    @IBOutlet weak var slideGreen: UISlider!
    
    @IBOutlet weak var slideBlue: UISlider!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Action
    @IBAction func redSlider(_ sender: UISlider) {
        let redValue = Int(slideRed.value)
        let greenValue = Int(slideGreen.value)
        let blueValue = Int(slideBlue.value)
        let backgroundColor = UIColor(
            red: CGFloat(redValue) / 255,
            green: CGFloat(greenValue)  / 255,
            blue: CGFloat(blueValue ) / 255,
            alpha: 1.0
        ) // lấy giá tị bảng màu từ 0-1
        colorView.backgroundColor = backgroundColor
        colorText.text = "Color (Red: \(redValue), Green: \(greenValue), Blue: \(blueValue))"
    }
    
}
