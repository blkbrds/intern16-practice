//
//  BaiTap4ViewController.swift
//  BaiTapView
//
//  Created by NganHa on 7/1/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

final class BaiTap4ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var colorView: UIView!
    @IBOutlet private weak var colorLabel: UILabel!
    
    // MARK: - Propeties
    private var redValue: Float = 0.5
    private var greenValue: Float = 0.5
    private var blueValue: Float = 0.5
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUIViewColor()
        changeUIViewColor(red: redValue, green: greenValue, blue: blueValue)
        colorLabel.text = setUpColorLabel(red: redValue, green: greenValue, blue: blueValue)
    }
    
    // MARK: - Private functions
    //Change color for UIView
    private func changeUIViewColor(red r: Float, green gr: Float, blue b: Float) {
        colorView.backgroundColor = UIColor(cgColor: CGColor(srgbRed: CGFloat(r), green: CGFloat(gr), blue: CGFloat(b), alpha: 1))
    }
    
    private func setUpUIViewColor() {
        colorView.layer.cornerRadius = 20
    }
    
    private func setUpColorLabel(red r: Float, green gr: Float, blue b: Float) -> String {
        return "Color( R: \(Int(r * 225)), G: \(Int(gr * 225)), B: \(Int(b * 225)) )"
    }
    
    // MARK: - IBActions
    @IBAction private func redSliderValueChanged(_ sender: UISlider) {
        redValue = Float(sender.value)
        changeUIViewColor(red: redValue, green: greenValue, blue: blueValue)
        colorLabel.text = setUpColorLabel(red: redValue, green: greenValue, blue: blueValue)
    }
    
    @IBAction private func greenSliderValueChanged(_ sender: UISlider) {
        greenValue = Float(sender.value)
        changeUIViewColor(red: redValue, green: greenValue, blue: blueValue)
        colorLabel.text = setUpColorLabel(red: redValue, green: greenValue, blue: blueValue)
    }
    @IBAction private func blueSliderValueChanged(_ sender: UISlider) {
        blueValue = Float(sender.value)
        changeUIViewColor(red: redValue, green: greenValue, blue: blueValue)
        colorLabel.text = setUpColorLabel(red: redValue, green: greenValue, blue: blueValue)
    }
}
