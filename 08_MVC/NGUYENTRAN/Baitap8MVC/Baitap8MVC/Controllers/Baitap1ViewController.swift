//
//  Baitap1ViewController.swift
//  Baitap8MVC
//
//  Created by MBA0245P on 8/30/20.
//  Copyright © 2020 Tran Thao Nguyen. All rights reserved.
//

import UIKit

class Baitap1ViewController: UIViewController {
    
    var runningNumber = ""
    var leftValue = ""
    var rightValue = ""
    var result = ""
    var currentOperation: Operation = .null
    

    
//    //data
//    var a : Float {
//        get {
//            return Float(aTextField.text!) ?? 0
//        }
//    }
//
//    var b : Float {
//        get {
//            return Float(bTextField.text!) ?? 0
//        }
//    }
//
//    var result: Float = 0 {
//        didSet {
//            resultTextField.text = "\(result)"
//        }
//    }
//
//    //model
//    var calculator = Calculator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let calculatorView = Bundle.main.loadNibNamed("CalculatorView", owner: self, options: nil)?.first as? CalculatorView else { return }
        view.addSubview(calculatorView)
        
    }

//    @IBAction func tongHaiSo(_ sender: UIButton) {
//       result = calculator.add(a: self.a, b: self.b)
//    }
//
//    @IBAction func hieuHaiSo(_ sender: UIButton) {
//        result = calculator.sub(a: self.a, b: self.b)
//    }
//
//    @IBAction func nhanHaiSo(_ sender: UIButton) {
//        result = calculator.mul(a: self.a, b: self.b)
//    }
//
//    @IBAction func chiaHaiSo(_ sender: UIButton) {
//        result = calculator.div(a: self.a, b: self.b)
//    }
//

}
