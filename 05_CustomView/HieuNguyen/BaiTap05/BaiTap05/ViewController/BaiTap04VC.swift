//
//  BaiTap04VC.swift
//  BaiTap05
//
//  Created by PCI0020 on 7/1/20.
//  Copyright © 2020 hieu.ngq. All rights reserved.
//

import UIKit

class BaiTap04VC: UIViewController {

    @IBOutlet weak var dateTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateTextField.delegate = self
    }
    
    func setupDatePicker() {
        let screensize: CGRect = UIScreen.main.bounds
        let screenWidth = screensize.width
        let screenHeight = screensize.height
        let frame = CGRect(x: 0, y: screenHeight, width: screenWidth, height: screenHeight - 500)
        let datePicker = DatePickerView(frame: frame)
        view.addSubview(datePicker)
        datePicker.delegate = self
        UIView.animate(withDuration: 0.2, animations: {
            datePicker.frame.origin.y = 500
        })
    }
}

extension BaiTap04VC: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        dateTextField.endEditing(true)
        setupDatePicker()
        return true
    }
}

extension BaiTap04VC: DatePickerViewDelegate {
    func setData(_ view: DatePickerView, needPerformAction Action: DatePickerView.Action) {
        switch Action {
        case .setDataPicker(let data):
            dateTextField.text = data
        }
    }
}
