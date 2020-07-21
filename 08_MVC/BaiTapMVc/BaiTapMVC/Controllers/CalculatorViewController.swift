//
//  CalculatorViewController.swift
//  BaiTapMVC
//
//  Created by PCI0004 on 7/20/20.
//  Copyright © 2020 PCI0004. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet private weak var displayLabel: UILabel!

//    var numberOnScreen: Float = 0.0
//    var periviousNumber: Float = 0.0
    var checkMath: Bool = false
    var numberTag: Int = 0
    var temp1: String = ""
    var temp2: String = ""
    var periveousNumber: Float = 0.0
    var numberOnScreen: Float = 0.0
    var result: Int = 0

    @IBAction func procesValue(_ sender: UIButton) {
        let calculator = Calculator(a: periveousNumber, b: numberOnScreen)
        if displayLabel.text != "" && sender.tag != 11 && sender.tag != 16 {
            if sender.tag == 12 { //Cong
                displayLabel.text = "+"
                checkMath = true
                numberTag = sender.tag
            } else if sender.tag == 13 { // Tru
                displayLabel.text = "-"
            } else if sender.tag == 14 { // Nhan
                displayLabel.text = "*"
            } else if sender.tag == 15 { // Chia
                displayLabel.text = "/"
            }


        } else if sender.tag == 16 {
            if numberTag == 12 {
                displayLabel.text = String(calculator.add())
            } else if numberTag == 13 {
                displayLabel.text = String(calculator.subtract())
            } else if numberTag == 14 {
                displayLabel.text = String(calculator.multiply())
            } else if numberTag == 15 {
                displayLabel.text = String(calculator.divide())
            }
        } else if sender.tag == 11 {
            displayLabel.text = ""
            temp1 = ""
            temp2 = ""
            numberTag = 0
        }
    }
    @IBAction func numbers(_ sender: UIButton) {
        if checkMath == true {
            temp2 += String(sender.tag - 1)
            displayLabel.text = temp2
            //checkMath = false
            numberOnScreen = Float(temp2)!
        } else {
            displayLabel.text = ""
            temp1 += String(sender.tag - 1)
            displayLabel.text = temp1
            periveousNumber = Float(temp1)!
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
