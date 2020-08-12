//
//  DatePickerView.swift
//  Baitap5
//
//  Created by MBA0245P on 7/15/20.
//  Copyright © 2020 Tran Thao Nguyen. All rights reserved.
//

import UIKit

protocol DatePickerViewDelegate: class {
    func view(_ datePickerView: DatePickerView, needsPerform action: DatePickerView.Action)
}

class DatePickerView: UIView {

    @IBOutlet weak var datePickerView: UIDatePicker!

    var selectedDate = Date()

    weak var delegate: DatePickerViewDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    @IBAction func datePickerViewValueChanged(_ sender: UIDatePicker) {
        datePickerView.datePickerMode = UIDatePicker.Mode.date
        selectedDate = datePickerView.date
    }

    @IBAction func doneButtonPressed(_ sender: UIButton) {
        delegate?.view(self, needsPerform: .didTapDoneButton(selectedDate: selectedDate))
    }
}

extension DatePickerView {
    enum Action {
        case didTapDoneButton(selectedDate: Date)
    }
}
