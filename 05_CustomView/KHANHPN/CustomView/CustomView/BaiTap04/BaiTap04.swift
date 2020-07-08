//
//  BaiTap04.swift
//  CustomView
//
//  Created by PCI0007 on 7/8/20.
//  Copyright © 2020 Chipuscu. All rights reserved.
//

import UIKit

class BaiTap04: UIViewController, UITextFieldDelegate {
    // MARK: - Outlet
    @IBOutlet weak var dateTextField: UITextField!

    let picker = Bundle.main.loadNibNamed("PickerView", owner: self, options: nil)?.first as? PickerView

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(picker!)
        picker?.delegate = self
        dateTextField.delegate = self
        view.addSubview(dateTextField)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        picker?.isHidden = false
        return false
    }
}

// MARK: - Extensions
extension BaiTap04: PickerViewDelegate {
    func pickerView(_ pickerView: PickerView, didSelect date: String) {
        dateTextField.text = date
        view.endEditing(true)
    }
}
