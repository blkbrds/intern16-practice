//
//  BaiTap04.swift
//  BaiTapView
//
//  Created by PCI0004 on 7/2/20.
//  Copyright © 2020 PCI0004. All rights reserved.
//

import UIKit

final class BaiTap04: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var toadoLabel: UILabel!
    @IBOutlet private weak var colorView: UIView!
    @IBOutlet private weak var redSlider: UISlider!
    @IBOutlet private weak var greenSlider: UISlider!
    @IBOutlet private weak var blueSlider: UISlider!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - IBActions
    @IBAction private func sliderAction(_ sender: UISlider) {
        toadoLabel.text = "Color(R: \(redSlider.value * 255), G: \(greenSlider.value * 255),B: \(blueSlider.value * 255))"
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
    }
}
