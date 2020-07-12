//
//  BaiTap2ViewController.swift
//  BaiTapCustomVIew
//
//  Created by NganHa on 7/5/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

final class BaiTap2ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var valueTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    // MARK: - Properties
    private var sliderView: MySliderView = MySliderView()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        errorLabel.isHidden = true
        errorLabel.textColor = UIColor.red
        errorLabel.textAlignment = .center
        valueTextField.delegate = self
    }
    
    // MARK: - Private functions
    private func configView() {
        guard let newslider = Bundle.main.loadNibNamed("MySliderView", owner: self, options: nil)?.first as? MySliderView else { return }
        sliderView = newslider
        sliderView.frame = CGRect(x: 150, y: 300, width: 190, height: 200)
        view.addSubview(sliderView)
        sliderView.delegate = self
    }
    
    private func changeSliderState(with num: Float) {
        sliderView.processNum = num
    }
}

//MARK: - MySliderViewDelegate
extension BaiTap2ViewController: MySliderViewDelegate {
    func view(with num: Float) {
        valueTextField.text = String(format: "%.0f", num)
    }
}

//MARK: - UITextFieldDelegate
extension BaiTap2ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        guard let valueTextField = textField.text else {
            errorLabel.isHidden = false
            errorLabel.text = "You must to enter a value"
            return false
        }
        guard let numberValue = Float(valueTextField) else {
            errorLabel.isHidden = false
            errorLabel.text = "The value entered must be a number"
            return false
        }
        if numberValue > 100 {
            changeSliderState(with: 100)
            errorLabel.isHidden = false
            errorLabel.text = "The value must be in a range from 0 to 100"
        } else if numberValue < 0 {
            changeSliderState(with: 0)
            errorLabel.isHidden = false
            errorLabel.text = "The value must be in a range from 0 to 100"
        } else {
            changeSliderState(with: numberValue)
        }
        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        textField.text = ""
        return true
    }
}




