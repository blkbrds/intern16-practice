//
//  Baitap2ViewController.swift
//  Baitap5
//
//  Created by MBA0245P on 7/18/20.
//  Copyright © 2020 Tran Thao Nguyen. All rights reserved.
//

import UIKit

class Baitap2ViewController: UIViewController {
    
    @IBOutlet weak var thumbValueTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    var customSlider: CustomSiderView = CustomSiderView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configSliderView()
        errorLabel.isHidden = true
        thumbValueTextField.delegate = self
    }
    
    private func configSliderView() {
        guard let newSlider = (Bundle.main.loadNibNamed("CustomSliderView", owner: self, options: nil)?.first as? CustomSiderView) else { return }
        customSlider = newSlider
        customSlider.frame = CGRect(x: 150, y: 300, width: 78, height: 300)
        view.addSubview(customSlider)
        customSlider.delegate = self
    }
    
    private func changeSliderView(value: Float) {
        customSlider.thumbValue = value
    }
}

extension Baitap2ViewController: CustomSliderViewDelegate {
    func view(value: Float) {
        thumbValueTextField.text = String(format: "%.0f", value)
    }
}

extension Baitap2ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        guard let thumbValueTextField = textField.text else {
            errorLabel.isHidden = false
            errorLabel.text = "Value không được rỗng."
            return false
        }
        guard let thumbValue = Float(thumbValueTextField) else {
            errorLabel.isHidden = false
            errorLabel.text = "Hãy nhập giá trị số."
            return false
        }
        if thumbValue > 100 {
            changeSliderView(value: 100)
            errorLabel.isHidden = false
            errorLabel.text = "Nhập giá trị từ 0 đến 100"
        } else if thumbValue < 0 {
            changeSliderView(value: 0)
            errorLabel.isHidden = false
            errorLabel.text = "Nhập giá trị từ 0 đến 100"
        } else {
            errorLabel.isHidden = true
            changeSliderView(value: thumbValue)
        }
        return true
        
    }
}
