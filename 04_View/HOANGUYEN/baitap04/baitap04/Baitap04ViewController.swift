//
//  baitap04ViewController.swift
//  baitap04
//
//  Created by NXH on 6/30/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

class Baitap04ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var redSlider: UISlider!
    var redValue: Float = 0.5
    var blueValue: Float = 0.5
    var greenValue: Float = 0.5
    
    @IBAction func actionRedSlider(_ sender: UISlider) {
        redValue = sender.value
        backgroundView.backgroundColor = UIColor(red: CGFloat(redValue), green: CGFloat(greenValue), blue: CGFloat(blueValue), alpha: 1)
        titleLabel.text = "Color(R: \(Int(redValue * 255)), G: \(Int(greenValue * 255)), B: \(Int(blueValue * 255)))"
    }
    @IBAction func actionBlueSlider(_ sender: UISlider) {
        blueValue = sender.value
        backgroundView.backgroundColor = UIColor(red: CGFloat(redValue), green: CGFloat(greenValue), blue: CGFloat(blueValue), alpha: 1)
        titleLabel.text = "Color(R: \(Int(redValue * 255)), G: \(Int(greenValue * 255)), B: \(Int(blueValue * 255)))"
    }
    @IBAction func actionGreenSlider(_ sender: UISlider) {
        greenValue = sender.value
        backgroundView.backgroundColor = UIColor(red: CGFloat(redValue), green: CGFloat(greenValue), blue: CGFloat(blueValue), alpha: 1)
        titleLabel.text = "Color(R: \(Int(redValue * 255)), G: \(Int(greenValue * 255)), B: \(Int(blueValue * 255)))"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundView.layer.cornerRadius = 20
        backgroundView.layer.borderWidth = 1
        backgroundView.layer.borderColor = UIColor.black.cgColor
    }
}
