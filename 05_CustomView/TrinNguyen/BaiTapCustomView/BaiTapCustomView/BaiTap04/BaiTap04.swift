//
//  BaiTap04.swift
//  BaiTapCustomView
//
//  Created by PCI0004 on 7/8/20.
//  Copyright © 2020 PCI0004. All rights reserved.
//

import UIKit

final class BaiTap04: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var inputTextField: UITextField!

    // MARK: - Properties
    var myDatePickerView = Bundle.main.loadNibNamed("MyDatePickerView", owner: self, options: nil)?.first as? MyDatePickerView

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }

    // Private Function
    private func configUI() {
        guard let myDatePickerView = myDatePickerView else { return }
        myDatePickerView.frame = CGRect(x: 0, y: 600, width: 414, height: 271)
        view.addSubview(myDatePickerView)
        myDatePickerView.isHidden = true
        myDatePickerView.delegate = self
        inputTextField.delegate = self
    }
}

// MARK: - UITextFieldDelegate
extension BaiTap04: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        myDatePickerView?.isHidden = false
        return false
    }
}

// MARK: - MyDatePickerViewDelegate
extension BaiTap04: MyDatePickerViewDelegate {
    func datePickerView(_ view: MyDatePickerView, date: Date) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        inputTextField.text = dateFormatter.string(from: date)
        myDatePickerView?.isHidden = true
    }
}
