//
//  BaiTap4ViewController.swift
//  BaiTapView
//
//  Created by NganHa on 7/1/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

class BaiTap4ViewController: UIViewController {

    var redValue: Float = 0.5
    var greenValue: Float = 0.5
    var blueValue: Float = 0.5
    @IBOutlet private weak var colorView: UIView!
    @IBOutlet private weak var colorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUIViewColor()
        changeUIViewColor(red: redValue, green: greenValue, blue: blueValue)
        colorLabel.text = setUpColorLabel(red: redValue, green: greenValue, blue: blueValue)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func redSliderChanged(_ sender: UISlider) {
        redValue = Float(sender.value)
        changeUIViewColor(red: redValue, green: greenValue, blue: blueValue)
        colorLabel.text = setUpColorLabel(red: redValue, green: greenValue, blue: blueValue)
    }
    
    @IBAction func greenSliderChanged(_ sender: UISlider) {
        greenValue = Float(sender.value)
        changeUIViewColor(red: redValue, green: greenValue, blue: blueValue)
        colorLabel.text = setUpColorLabel(red: redValue, green: greenValue, blue: blueValue)
    }
    @IBAction func blueSliderChanged(_ sender: UISlider) {
        blueValue = Float(sender.value)
        changeUIViewColor(red: redValue, green: greenValue, blue: blueValue)
        colorLabel.text = setUpColorLabel(red: redValue, green: greenValue, blue: blueValue)
    }
    
    //Change color for UIView
    func changeUIViewColor(red r: Float, green gr: Float, blue b: Float) {
        colorView.backgroundColor = UIColor(cgColor: CGColor(srgbRed: CGFloat(r), green: CGFloat(gr), blue: CGFloat(b), alpha: 1))
    }
    
    func setUpUIViewColor() {
        colorView.layer.cornerRadius = 20
    }
    
    func setUpColorLabel(red r: Float, green gr: Float, blue b: Float) -> String {
            return "Color( R: \(Int(r * 225)), G: \(Int(gr * 225)), B: \(Int(b * 225)) )"
    }
    


    

}
