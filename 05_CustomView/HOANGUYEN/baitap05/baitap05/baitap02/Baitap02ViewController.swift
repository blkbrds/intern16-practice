//
//  Baitap02ViewController.swift
//  baitap05
//
//  Created by NXH on 7/3/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

protocol Baitap02Delegate: class {
    func changeValueSlider(_ view: Baitap02ViewController, value: String)
}

class Baitap02ViewController: UIViewController {

    @IBOutlet private weak var valueTextField: UITextField!
    
    
    var customSlider: MySliderView! = nil
    private var valueInputTextField: String = "0"
    weak var delegate: Baitap02Delegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        customSlider = Bundle.main.loadNibNamed("MySliderView", owner: nil, options: nil)?.first as? MySliderView
        customSlider.center.x = view.center.x
        customSlider.center.y = view.center.y
        view.addSubview(customSlider)
        valueTextField.delegate = self
        customSlider.delegate = self
        self.delegate = customSlider
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
}
extension Baitap02ViewController: MySliderDelegate {
    func mySlider(_ view: MySliderView, panTo value: Int) {
        print("Value: ", value)
        valueTextField.text = String(value)
    }
}
extension Baitap02ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField === valueTextField {
            delegate?.changeValueSlider(self, value: textField.text!)
        }
        return true
    }
}
