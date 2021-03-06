//
//  DatePickerView.swift
//  BaiTapCustomView1
//
//  Created by MacBook Pro on 7/6/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

protocol DatePickerViewDelegate: class {
    func doneTime(_ view: DatePickerView,needsPerform action: DatePickerView.Action)
}

final class DatePickerView: UIView {

    // MARK: - IBOutlets
    @IBOutlet private weak var dateTimePicker: UIDatePicker!
    @IBOutlet private weak var doneButton: UIButton!
    @IBOutlet private weak var containButtonUIView: UIView!

    // MARK: - Properties
    weak var delegate: DatePickerViewDelegate?
    private let dateFormater: DateFormatter = DateFormatter()
    private var date: Date = Date()

    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: - IBActions
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

// MARK: - Config
extension DatePickerView {
    enum Action {
        case didClickDatePicker(date : Date)
    }
}
