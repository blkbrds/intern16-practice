//
//  Baitap4ViewController.swift
//  Baitap4
//
//  Created by MBA0245P on 7/5/20.
//  Copyright © 2020 Tran Thao Nguyen. All rights reserved.
//

import UIKit

class Baitap4ViewController: UIViewController {
    @IBOutlet weak var colorValueLabel: UILabel!

    @IBOutlet weak var colorDisplayView: UIView!

    @IBOutlet weak var redColorSlider: UISlider!

    @IBOutlet weak var greenColorSlider: UISlider!

    @IBOutlet weak var blueColorSlider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()

        redColorSlider.minimumValue = 0
        redColorSlider.maximumValue = 255
        redColorSlider.value = 100

        greenColorSlider.minimumValue = 0
        greenColorSlider.maximumValue = 255
        greenColorSlider.value = 100

        blueColorSlider.minimumValue = 0
        blueColorSlider.maximumValue = 255
        blueColorSlider.value = 100

        colorDisplayView.backgroundColor = UIColor(red: CGFloat(redColorSlider.value / 255), green: CGFloat(greenColorSlider.value / 255), blue: CGFloat(blueColorSlider.value / 255), alpha: 1.0)
        colorValueLabel.text = "Color (R: \(Int(redColorSlider.value)), G: \(Int(greenColorSlider.value)), B: \(Int(blueColorSlider.value)))"
    }

    @IBAction func redColorSliderValueChanged(_ sender: UISlider) {
        colorDisplayView.backgroundColor = UIColor(red: CGFloat(redColorSlider.value / 255), green: CGFloat(greenColorSlider.value / 255), blue: CGFloat(blueColorSlider.value / 255), alpha: 1.0)
        colorValueLabel.text = "Color (R: \(Int(redColorSlider.value)), G: \(Int(greenColorSlider.value)), B: \(Int(blueColorSlider.value)))"
    }
    
    @IBAction func greenColorSliderValueChanged(_ sender: UISlider) {
        colorDisplayView.backgroundColor = UIColor(red: CGFloat(redColorSlider.value / 255), green: CGFloat(greenColorSlider.value / 255), blue: CGFloat(blueColorSlider.value / 255), alpha: 1.0)
        colorValueLabel.text = "Color (R: \(Int(redColorSlider.value)), G: \(Int(greenColorSlider.value)), B: \(Int(blueColorSlider.value)))"
    }

    @IBAction func blueColorSliderValueChanged(_ sender: UISlider) {
        colorDisplayView.backgroundColor = UIColor(red: CGFloat(redColorSlider.value / 255), green: CGFloat(greenColorSlider.value / 255), blue: CGFloat(blueColorSlider.value / 255), alpha: 1.0)
        colorValueLabel.text = "Color (R: \(Int(redColorSlider.value)), G: \(Int(greenColorSlider.value)), B: \(Int(blueColorSlider.value)))"

    }
}
