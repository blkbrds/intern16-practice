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
    func doneTime(_ view: DatePickerView, needsPerform action: DatePickerView.Action)
}

final class DatePickerView: UIView {
    
    //MARK: - IBOulet
    @IBOutlet private weak var dateTimePicker: UIDatePicker!
    @IBOutlet private weak var containButtonView: UIView!
    @IBOutlet private weak var doneButton: UIButton!
    
    // MARK: - Properties
    weak var delegate: DatePickerViewDelegate?
    let dateFormater: DateFormatter = DateFormatter()
    var dateValue: String = ""
    var date: Date = Date()
    
    //MARK: - Override
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - IBAction
    @IBAction private func actionDateTimePicker(_ sender: UIDatePicker) {
        date = dateTimePicker.date
        dateFormater.dateFormat = "MMM dd, yyyy"
        dateValue = dateFormater.string(from: date)
    }
    
    @IBAction private func actionDoneButton(_ sender: UIButton) {
        date = dateTimePicker.date
        dateFormater.dateFormat = "MMM dd, yyyy"
        dateValue = dateFormater.string(from: date)
        delegate?.doneTime(self, needsPerform: .didClickDatePicker(date: date))
    }
}

//MARK: - Extension
extension DatePickerView {
    enum Action {
        case didClickDatePicker(date: Date)
    }
}
