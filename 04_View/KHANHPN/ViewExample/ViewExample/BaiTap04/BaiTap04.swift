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
    @IBOutlet private weak var colorView: UIView!
    @IBOutlet private weak var textLabel: UILabel!
    @IBOutlet private weak var redSlider: UISlider!
    @IBOutlet private weak var greenSlider: UISlider!
    @IBOutlet private weak var blueSlider: UISlider!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Action
    @IBAction private func changeValueSliderTouchUpInside(_ sender: UISlider) {
        let redValue = Int(redSlider.value)
        let greenValue = Int(greenSlider.value)
        let blueValue = Int(blueSlider.value)
        let backgroundColor = UIColor(
            red: CGFloat(redValue) / 255,
            green: CGFloat(greenValue)  / 255,
            blue: CGFloat(blueValue ) / 255,
            alpha: 1.0
        )
        colorView.backgroundColor = backgroundColor
        textLabel.text = "Color (Red: \(redValue), Green: \(greenValue), Blue: \(blueValue))"
    }
}
