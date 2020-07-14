//
//  MyDatePickerView.swift
//  BaiTapCustomView
//
//  Created by PCI0004 on 7/8/20.
//  Copyright © 2020 PCI0004. All rights reserved.
//

import UIKit

// MARK: - Protocol
protocol MyDatePickerViewDelegate: class {
    func datePickerView(_ MyDatePickerView: MyDatePickerView, date: Date)
}

final class MyDatePickerView: UIView {

    // MARK: - IBOutlets
    @IBOutlet private weak var datePicker: UIDatePicker!
    @IBOutlet private weak var toolBar: UIToolbar!
    @IBOutlet private weak var doneButton: UIBarButtonItem!

    // MARK: Properties
    weak var delegate: MyDatePickerViewDelegate?
    var date = Date()

    // MARK: - IBActions
    @IBAction private func datePicker(_ sender: Any) {
        date = datePicker.date
    }

    @IBAction private func clickButton(_ sender: Any) {
        delegate?.datePickerView(self, date: date)
    }
}
