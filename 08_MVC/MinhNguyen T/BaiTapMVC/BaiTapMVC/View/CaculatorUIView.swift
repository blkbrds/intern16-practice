//
//  CaculatorUIView.swift
//  BaiTapMVC
//
//  Created by MacBook Pro on 7/17/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class CaculatorUIView: UIView {

    // MARK: - IBOutlet
    @IBOutlet weak var numberResultLabel: UILabel!
    // MARK: - Private properties
    private var numberOnScreen: Float = 0
    private var previousNumber: Float = 0
    private var performMath = false
    private var operation = 0

    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: - Function
    @IBAction private func numberButtonTouchUpInside(_ sender: UIButton) {
        if performMath == true {
            numberResultLabel.text = String(sender.tag - 1)
            guard let textNumber = numberResultLabel.text, let newNumber = Float(textNumber) else { return }
            numberOnScreen = newNumber
            performMath = false
        } else {
            guard let text = numberResultLabel.text, text.isEmpty else { return }
            numberResultLabel.text = text + String(sender.tag - 1)
            guard let textNumber = numberResultLabel.text, let newNumber = Float(textNumber) else { return }
            numberOnScreen = newNumber
        }
    }

    @IBAction private func calButtonTouchUpInside(_ sender: UIButton) {
        if numberResultLabel.text != "" && sender.tag != 11 && sender.tag != 12 {
            previousNumber = Float(numberResultLabel.text!)!
            if sender.tag == 13 {
                numberResultLabel.text = "+"
            } else if sender.tag == 14 {
                numberResultLabel.text = "-"
            } else if sender.tag == 15 {
                numberResultLabel.text = "*"
            } else if sender.tag == 16 {
                numberResultLabel.text = "/"
            }
            performMath = true
            operation = sender.tag
        } else if sender.tag == 12 {
            let result = Caculator(a: previousNumber, b: numberOnScreen)
            if operation == 13 {
                numberResultLabel.text = String(result.sumNumber())
            } else if operation == 14 {
                numberResultLabel.text = String(result.subNumber())
            } else if operation == 15 {
                numberResultLabel.text = String(result.mulNumber())
            } else if operation == 16 {
                numberResultLabel.text = String(result.divNumber())
            }
        } else if sender.tag == 11 {
            numberResultLabel.text = ""
            previousNumber = 0
            numberOnScreen = 0
            operation = 0
        }
    }
}
