//
//  BaiTap04.swift
//  CustomView
//
//  Created by PCI0007 on 7/8/20.
//  Copyright © 2020 Chipuscu. All rights reserved.
//

import UIKit

final class BaiTap04: UIViewController, UITextFieldDelegate {
    // MARK: - Outlet
    @IBOutlet weak var dateTextField: UITextField!

    let picker = Bundle.main.loadNibNamed("MyDatePickerView", owner: self, options: nil)?.first as? MyDatePickerView
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Functions
    private func setupView() {
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
    func pickerView(_ pickerView: MyDatePickerView, didSelect date: Date) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd yyyy"
        dateTextField.text = dateFormatter.string(from: date)
        view.endEditing(true)
    }
}
