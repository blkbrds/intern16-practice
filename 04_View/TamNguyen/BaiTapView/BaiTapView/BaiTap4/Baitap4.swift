//
//  Bai4.swift
//  TAMNGUYEN
//
//  Created by PCI0001 on 7/2/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

final class Bai4ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var redSlider: UISlider!
    @IBOutlet private weak var greenSlider: UISlider!
    @IBOutlet private weak var blueSlider: UISlider!
    @IBOutlet private weak var redLabel: UILabel!
    @IBOutlet private weak var greenLabel: UILabel!
    @IBOutlet private weak var blueLabel: UILabel!
    
    // MARK: - IBAction
    @IBAction private func sliderDidChange(_ sender: Any) {
        redSlider.minimumValue = 0
        redSlider.maximumValue = 255
        greenSlider.minimumValue = 0
        greenSlider.maximumValue = 255
        blueSlider.minimumValue = 0
        blueSlider.maximumValue = 255
        self.view.backgroundColor = UIColor(red: CGFloat(redSlider.value)/255, green: CGFloat(greenSlider.value)/255, blue: CGFloat(blueSlider.value)/255, alpha: 1)
        redLabel.text = String(Int(redSlider.value))
        greenLabel.text = String(Int(greenSlider.value))
        blueLabel.text = String(Int(blueSlider.value))
    }
}
