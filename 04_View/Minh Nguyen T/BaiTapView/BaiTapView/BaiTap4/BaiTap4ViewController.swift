//
//  BaiTap4ViewController.swift
//  BaiTapView
//
//  Created by MacBook Pro on 7/2/20.
//  Copyright © 2020 asiantech. All rights reserved.
//
import UIKit

final class BaiTap4ViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak private var hienthiLabel: UILabel!
    @IBOutlet weak private var colorView: UIView!
    @IBOutlet weak private var redSlider: UISlider!
    @IBOutlet weak private var blueSlider: UISlider!
    @IBOutlet weak private var greenSlider: UISlider!

    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        hienthiLabel.text = "(Color R: 0 G: 0 B: 0)"
    }

    // MARK: - IBActions
    @IBAction private func sliderValueChanged(_ sender: UISlider) {
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value)/255, green: CGFloat(greenSlider.value)/255, blue: CGFloat(blueSlider.value)/255, alpha: 1)
        hienthiLabel.text = "(Color R: \(Int(redSlider.value)) G: \(Int(greenSlider.value)) B: \(Int(blueSlider.value)))"
    }
}
