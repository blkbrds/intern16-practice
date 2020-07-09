//
//  MyDatePickerView.swift
//  BaiTapCustomView
//
//  Created by PCI0004 on 7/8/20.
//  Copyright © 2020 PCI0004. All rights reserved.
//

import UIKit

// MARK: Protocol
protocol MyDatePickerViewDelegate: class {
    func datePickerView(_ MyDatePickerView: MyDatePickerView, date: Date)
}

class MyDatePickerView: UIView {

    // MARK: - IBOutlets
    @IBOutlet private weak var datePickerView: UIDatePicker!
    @IBOutlet private weak var toolBar: UIToolbar!
    @IBOutlet private weak var doneButton: UIBarButtonItem!

    // MARK : - Propeties
    weak var delegate: MyDatePickerViewDelegate?
    var date = Date()

    // MARK: - IBActions
    @IBAction func datePicker(_ sender: Any) {
        date = datePickerView.date
    }

    @IBAction func clickButton(_ sender: Any) {
        delegate?.datePickerView(self, date: date)
    }
}
