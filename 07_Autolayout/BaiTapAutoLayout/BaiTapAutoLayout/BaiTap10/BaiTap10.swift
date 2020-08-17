//
//  BaiTap10.swift
//  BaiTapAutoLayout
//
//  Created by PCI0004 on 7/16/20.
//  Copyright © 2020 PCI0004. All rights reserved.
//

import UIKit

final class BaiTap10: UIViewController {

    @IBOutlet private weak var greenView: UIView!
    @IBOutlet private weak var purpleView: UIView!
    @IBOutlet private weak var yellowView: UIView!
    @IBOutlet private weak var grayView: UIView!
    @IBOutlet private weak var number1Constraints: NSLayoutConstraint!
    @IBOutlet private weak var number2Constraints: NSLayoutConstraint!
    @IBOutlet private weak var number3Constraints: NSLayoutConstraint!
    @IBOutlet private weak var number4Constraints: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        tapChageShape()
    }
    private func tapChageShape() {
        greenView.isUserInteractionEnabled = true
        purpleView.isUserInteractionEnabled = true
        yellowView.isUserInteractionEnabled = true
        grayView.isUserInteractionEnabled = true

        let tap1 = UITapGestureRecognizer(target: self, action: #selector(processShapeGreen))
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(processShapePurple))
        let tap3 = UITapGestureRecognizer(target: self, action: #selector(processShapeYellow))
        let tap4 = UITapGestureRecognizer(target: self, action: #selector(processShapeGray))

        greenView.addGestureRecognizer(tap1)
        purpleView.addGestureRecognizer(tap2)
        yellowView.addGestureRecognizer(tap3)
        grayView.addGestureRecognizer(tap4)


    }
    @objc private func processShapeGreen() {
        number1Constraints.constant = 150
        number2Constraints.constant = 75
        number3Constraints.constant = 75
        number4Constraints.constant = 75
    }
    @objc private func processShapePurple() {
        number1Constraints.constant = 75
        number2Constraints.constant = 150
        number3Constraints.constant = 75
        number4Constraints.constant = 75
    }
    @objc private func processShapeYellow() {
        number1Constraints.constant = 75
        number2Constraints.constant = 75
        number3Constraints.constant = 150
        number4Constraints.constant = 75
    }
    @objc private func processShapeGray() {
        number1Constraints.constant = 75
        number2Constraints.constant = 75
        number3Constraints.constant = 75
        number4Constraints.constant = 150
    }
}
