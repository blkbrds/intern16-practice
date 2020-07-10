//
//  DatePickerView.swift
//  Bai5
//
//  Created by PCI0001 on 7/7/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit
// MARK: - Protocol
protocol DatePickerViewDelegate: class {
    func dateTime(_ view: DatePickerView, date: Date)
}

class DatePickerView: UIView {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var doneButton: UIButton!
    
    // MARK: - Propeties
        private var selectedDate = String()
        var delegateDate: DatePickerViewDelegate?

        // MARK: - Life cycle
        override class func awakeFromNib() {
            super.awakeFromNib()
        }

        // MARK: - IBActions
        @IBAction func doneButtonPressed(_ sender: UIButton) {
            delegateDate?.view(self, needsPerform: .didTapButtonDone(getDate: selectedDate))
        }

        @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
            datePicker.datePickerMode = UIDatePicker.Mode.date
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMMM dd yyyy"
            selectedDate = dateFormatter.string(from: datePicker.date)
        }
    }

    //MARK: -Extension
    extension DatePickerView {
        enum Action {
            case didTapButtonDone(getDate: String)
        }
}
