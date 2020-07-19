//
//  DatePickerView.swift
//  Baitap5
//
//  Created by MBA0245P on 7/15/20.
//  Copyright © 2020 Tran Thao Nguyen. All rights reserved.
//

import UIKit

protocol DatePickerViewDelegate: class {
    func datePickerView(_ datePickerView: DatePickerView, needsPerform action: DatePickerView.Action)
}

class DatePickerView: UIView {

    @IBOutlet weak var datePickerView: UIDatePicker!
    @IBOutlet weak var toolBar: UIToolbar!

    var selectedDate = Date()

    weak var delegate: DatePickerViewDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        toolBar.frame.origin.x = 0
        toolBar.frame.origin.y = 0
        datePickerView.frame.origin.x = 0
        datePickerView.frame.origin.y = toolBar.frame.height
    }

    @IBAction func datePickerViewValuedChanged(_ sender: UIDatePicker) {
        selectedDate = datePickerView.date
    }

    @IBAction func doneButton(_ sender: UIBarButtonItem) {
        UIView.transition(with: self, duration: 3, options: .transitionCurlDown, animations: {
            self.isHidden = true
            self.delegate?.datePickerView(self, needsPerform: .selectedDate(selectedDate: self.selectedDate))
        })
    }
}

extension DatePickerView {
    enum Action {
        case selectedDate(selectedDate: Date)
    }
}
