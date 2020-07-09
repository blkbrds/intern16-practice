//
//  BaiTap04.swift
//  BaiTapCustomView
//
//  Created by PCI0004 on 7/8/20.
//  Copyright © 2020 PCI0004. All rights reserved.
//

import UIKit

class BaiTap04: UIViewController {

    // MARK: IBOutlets
    @IBOutlet private weak var inputTextField: UITextField!

    // MARK: - Propeties
    var datePicker = Bundle.main.loadNibNamed("MyDatePickerView", owner: self, options: nil)?[0] as? MyDatePickerView

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }

    // Private Function
    private func configUI() {
        datePicker?.frame = CGRect(x: 0, y: 600, width: 414, height: 271)
        view.addSubview(datePicker!)
        datePicker?.isHidden = true
        datePicker?.delegate = self
        inputTextField.delegate = self
    }
}

// MARK: - UITextFieldDelegate
extension BaiTap04: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        datePicker?.isHidden = false
        return false
    }
}

// MARK: - MyDatePickerViewDelegate
extension BaiTap04: MyDatePickerViewDelegate {
    func datePickerView(_ view: MyDatePickerView, date: Date) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        inputTextField.text = dateFormatter.string(from: date)
        datePicker?.isHidden = true
    }
}
