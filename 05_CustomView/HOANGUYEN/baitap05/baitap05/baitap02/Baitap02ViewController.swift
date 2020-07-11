//
//  Baitap02ViewController.swift
//  baitap05
//
//  Created by NXH on 7/3/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

class Baitap02ViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet private weak var valueTextField: UITextField!
    // MARK: - properties
    private var customSlider: MySlider!
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        customSlider = Bundle.main.loadNibNamed("MySliderView", owner: nil, options: nil)?.first as? MySlider
        customSlider.center.x = view.center.x
        customSlider.center.y = view.center.y
        view.addSubview(customSlider)
        valueTextField.delegate = self
        customSlider.delegate = self
    }
    // MARK: - Override Function
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

// MARK: - Extension
extension Baitap02ViewController: MySliderDelegate {
    func mySlider(_ view: MySlider, needsPerform action: MySlider.Action) {
        switch action {
        case .dragThumb(let value):
            valueTextField.text = "\(value)"
        }
    }
}
extension Baitap02ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField === valueTextField {
            if let textField = valueTextField {
                let value: String = textField.text ?? "0"
                customSlider.changeValueSlider(value: value)
            }
        }
        view.endEditing(true)
        return true
    }
}
