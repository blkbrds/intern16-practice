//
//  BaiTap4ViewController.swift
//  BaiTapCustomView1
//
//  Created by MacBook Pro on 7/6/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class BaiTap2ViewController: UIViewController {
    
    // MARK: - IBOulet Properties
    @IBOutlet weak var valueTextField: UITextField!
    var sliderView:MySliderView?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configSlider()
    }
    // MARK: - Private Funtion
    private func configSlider() {
        sliderView = Bundle.main.loadNibNamed("MySliderView", owner: self, options: nil)?[0] as? MySliderView
        sliderView?.frame = CGRect(x: 90, y: 200, width: view.frame.width, height: view.frame.height)
        view.addSubview(sliderView!)
        sliderView?.delegate = self
        valueTextField.delegate = self
    }

    private func changeSlider(num : String) {
        sliderView?.valueSlider = Int(num)
        sliderView?.setSliderView()
    }
}

// MARK: - SliderView Delegate
extension BaiTap2ViewController : MySliderViewDelegate {
    func view(_ view: MySliderView, needsPerform action: MySliderView.Action) {
        switch action {
        case .changeValueSlider(valueSlide: let newValue):
            valueTextField.text = String(newValue)
        }
    }
}

// MARK: - UITextFieldDelegate
extension BaiTap2ViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        changeSlider(num: valueTextField.text ?? "50")
        return true
    }
}
