//
//  BaiTap4ViewController.swift
//  BaiTapView
//
//  Created by MacBook Pro on 7/2/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class BaiTap4ViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var hienthiLabel: UILabel!
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    
    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        hienthiLabel.text = "(Color R: 0 G: 0 B: 0)"
    }
    // MARK: - IBActions
    @IBAction func sliderColor(_ sender: Any) {
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value)/255, green: CGFloat(greenSlider.value)/255, blue: CGFloat(blueSlider.value)/255, alpha: 1)
        hienthiLabel.text = "(Color R: \(Int(redSlider.value)) G: \(Int(greenSlider.value)) B: \(Int(blueSlider.value)))"
    }
}
