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
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var doneButton: UIButton!
    
    // MARK: - Propeties
    private var selectedDate = Date()
    var delegateDate: MyDatePickerViewDelegate?
    
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
        selectedDate = datePicker.date
    }
}

//MARK: -Extension
extension MyDatePickerView {
    enum Action {
        case didTapButtonDone(getDate: Date)
    }
    
}
