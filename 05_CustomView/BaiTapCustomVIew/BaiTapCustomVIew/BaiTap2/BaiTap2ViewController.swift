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
    
    // MARK: - Propeties
    private var slider: MySliderView?
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        valueTextField.delegate = self
    }
    
    // MARK: - Private functions
    private func configView() {
        slider = Bundle.main.loadNibNamed("MySliderView", owner: self, options: nil)?.first as? MySliderView
        slider?.frame = CGRect(x: 150, y: 300, width: 190, height: 200)
        view.addSubview(slider!)
        slider?.delegate = self
    }
    
    private func changeSliderState(with num: String) {
        slider?.processNum = Float(num)
        slider?.setViewAndProcess()
    }
}

//MARK: -Extension
extension BaiTap2ViewController: ProcessValue {
    func sendValue(with num: Float) {
        valueTextField.text = String(format: "%.0f", num)
    }
}

extension BaiTap2ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        changeSliderState(with: textField.text ?? "50")
        print("return")
        return true
    }
}


