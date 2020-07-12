//
//  MyDatePickerView.swift
//  BaiTapCustomVIew
//
//  Created by NganHa on 7/7/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

protocol MyDatePickerViewDelegate : class {
    func view(_ datePickerView: MyDatePickerView, needsPerform action: MyDatePickerView.Action)
}

final class MyDatePickerView: UIView {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var datePicker: UIDatePicker!
    @IBOutlet private weak var doneButton: UIButton!
    
    // MARK: - Properties
    private var selectedDate = Date()
    var delegateDate: MyDatePickerViewDelegate?
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - IBActions
    @IBAction private func doneButtonPressed(_ sender: UIButton) {
        delegateDate?.view(self, needsPerform: .didTapButtonDone(getDate: selectedDate))
    }
    
    @IBAction private func datePickerValueChanged(_ sender: UIDatePicker) {
        datePicker.datePickerMode = UIDatePicker.Mode.date
        selectedDate = datePicker.date
    }
}

// MARK: - Config
extension MyDatePickerView {
    enum Action {
        case didTapButtonDone(getDate: Date)
    }
}
