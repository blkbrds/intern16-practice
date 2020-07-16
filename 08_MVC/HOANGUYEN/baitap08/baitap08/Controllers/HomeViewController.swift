//
//  HomeViewController.swift
//  baitap08
//
//  Created by NXH on 7/14/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
    
    @IBOutlet weak var resultLablel: UILabel!
    // MARK: - Properties
    private var numberSave: Float = 0
    private var statusButtonString: String = ""
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Private Function
    private func clear() {
        numberSave = 0
        shareCalculator.calculators = [0, 0]
        resultLablel.text = "0"
        shareCalculator.operato = .plus
    }
    
    // MARK: - IBAction
    @IBAction func touchUpInsideButton(_ sender: UIButton) {
        if shareCalculator.operato == .equal {
            clear()
        }
        numberSave = numberSave * 10 + Float(sender.tag)
        shareCalculator.calculators[1] = numberSave
        print(shareCalculator.calculators)
        resultLablel.text = String(Int(numberSave))
    }
    @IBAction private func clear(_ sender: UIButton) {
        clear()
    }
    @IBAction private func operatorNumber(_ sender: UIButton) {
        if shareCalculator.operato == .div && shareCalculator.calculators[1] == 0 {
            clear()
            resultLablel.text = "Chia cho 0"
            return
        }
        guard let result = shareCalculator.processingCalculator() else { return }
        switch sender.titleLabel?.text {
        case "+":
            shareCalculator.operato = .plus
        case "-":
            shareCalculator.operato = .minus
        case "×":
            shareCalculator.operato = .mul
        case "=":
            shareCalculator.operato = .equal
            shareCalculator.calculators[0] = result
        default:
            shareCalculator.operato = .div
        }
        resultLablel.text = result.clean
        numberSave = 0
        shareCalculator.calculators[1] = 0
    }
}
// MARK: - Extension
extension Float {
    var clean: String {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}

