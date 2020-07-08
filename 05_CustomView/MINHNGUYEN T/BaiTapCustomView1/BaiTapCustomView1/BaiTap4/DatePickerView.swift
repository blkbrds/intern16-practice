//
//  DatePickerView.swift
//  BaiTapCustomView1
//
//  Created by MacBook Pro on 7/6/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

// MARK: - CustomDateTimePickerDelegate
protocol DatePickerViewDelegate: class {
    func doneTime(_ view: DatePickerView,needsPerform action: DatePickerView.Action)
}

class DatePickerView: UIView {

    // MARK: IBOutlet Properties
    @IBOutlet weak var dateTimePicker: UIDatePicker!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var containButtonUIView: UIView!

    // MARK: - Properties
    weak var delegate: DatePickerViewDelegate?
    let dateFormater: DateFormatter = DateFormatter()
    var dateValue: String!
    var date: Date = Date()
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: - IBAction
    @IBAction func actionDateTimePicker(_ sender: UIDatePicker) {
        date = dateTimePicker.date
        dateFormater.dateFormat = "MMM dd, yyyy"
        dateValue = dateFormater.string(from: date)
    }
    
    @IBAction func actionDoneButton(_ sender: UIButton) {
        date = dateTimePicker.date
        dateFormater.dateFormat = "MMM dd, yyyy"
        dateValue = dateFormater.string(from: date)
        delegate?.doneTime(self, needsPerform: .didClickDatePicker(date: date))
    }
}

extension DatePickerView {
    enum Action {
        case didClickDatePicker(date : Date)
    }
}
