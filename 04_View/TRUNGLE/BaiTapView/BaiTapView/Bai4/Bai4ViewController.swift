//
//  Bai4ViewController.swift
//  BaiTapView
//
//  Created by Trung Le D. on 7/1/20.
//  Copyright © 2020 Trung Le D. All rights reserved.
//

import UIKit

class Bai4ViewController: UIViewController {
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var inforColor: UILabel!
    @IBOutlet weak var colorView: UIView!
    var redValue: CGFloat = 0
    var greenValue: CGFloat = 0
    var blueValue: CGFloat = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        colorView.backgroundColor = UIColor(red: redValue, green: greenValue , blue: blueValue , alpha: 1.0)
    }
    @IBAction func redSlider(_ sender: UISlider) {
        redValue = CGFloat(sender.value)
        inforColor.text = "Color(Red: \(Int(redValue)), Green: \(Int(greenValue)), Blue: \(Int(blueValue)))"
        displayColors()
    }
    
    @IBAction func greenSlider(_ sender: UISlider) {
        greenValue = CGFloat(sender.value)
        inforColor.text = "Color(Red: \(Int(redValue)), Green: \(Int(greenValue)), Blue: \(Int(blueValue)))"
        displayColors()
    }
    
    @IBAction func blueSilder(_ sender: UISlider)   {
        blueValue = CGFloat(sender.value)
        inforColor.text = "Color(Red: \(Int(redValue)), Green: \(Int(greenValue)), Blue: \(Int(blueValue)))"
        displayColors()
    }
    func displayColors() {
        colorView.backgroundColor = UIColor(red: redValue / 255, green: greenValue / 255, blue: blueValue / 255, alpha: 1.0)
    }
    
}




