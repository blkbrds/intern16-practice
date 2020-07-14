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

final class DatePickerView: UIView {

    // MARK: IBOutlet Properties
    @IBOutlet weak private var dateTimePicker: UIDatePicker!
    @IBOutlet weak private var doneButton: UIButton!
    @IBOutlet weak private var containButtonUIView: UIView!

    // MARK: - Properties
    weak var delegate: DatePickerViewDelegate?
    let dateFormater: DateFormatter = DateFormatter()
    var date: Date = Date()
    
    // MARK: - awakeFromNib
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: - IBAction
    @IBAction private func actionDateTimePicker(_ sender: UIDatePicker) {
        date = dateTimePicker.date
        dateFormater.dateFormat = "MMM dd, yyyy"
    }
    
    @IBAction private func actionDoneButton(_ sender: UIButton) {
        date = dateTimePicker.date
        dateFormater.dateFormat = "MMM dd, yyyy"
        delegate?.doneTime(self, needsPerform: .didClickDatePicker(date: date))
    }
}

extension DatePickerView {
    enum Action {
        case didClickDatePicker(date : Date)
    }
}
