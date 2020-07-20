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
            guard let number = numberResultLabel.text, let nb = Float(number) else { return }
            numberOnScreen = nb
            performMath = false
        } else {
            guard let text = numberResultLabel.text, text.isEmpty else { return }
            numberResultLabel.text = text + String(sender.tag - 1)
            guard let number = numberResultLabel.text, let nb = Float(number) else { return }
            numberOnScreen = nb
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
            let result = Caculator()
            if operation == 13 {
                numberResultLabel.text = String(result.sumNumber(a: previousNumber, b: numberOnScreen))
            } else if operation == 14 {
                numberResultLabel.text = String(result.subNumber(a: previousNumber, b: numberOnScreen))
            } else if operation == 15 {
                numberResultLabel.text = String(result.mulNumber(a: previousNumber, b: numberOnScreen))
            } else if operation == 16 {
                numberResultLabel.text = String(result.divNumber(a: previousNumber, b: numberOnScreen))
            }
        } else if sender.tag == 11 {
            numberResultLabel.text = ""
            previousNumber = 0
            numberOnScreen = 0
            operation = 0
        }
    }
}
