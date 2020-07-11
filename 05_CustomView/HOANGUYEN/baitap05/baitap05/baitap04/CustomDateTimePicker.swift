//
//  CustomDateTimePicker.swift
//  baitap05
//
//  Created by NXH on 7/5/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

// MARK: - Protocol
protocol CustomDateTimePickerDelegate: class {
    func dateTime(_ view: CustomDateTimePicker, needsPerform action: CustomDateTimePicker.Action)
}

class CustomDateTimePicker: UIView {
    
    // MARK: - IBOutlets
    @IBOutlet weak var dateTimePicker: UIDatePicker!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var containButtonUIView: UIView!
    // MARK: - Propeties
    weak var delegate: CustomDateTimePickerDelegate?
    var date: Date = Date()
    
    // MARK: - Life cycle
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - IBActions
    @IBAction func actionDoneButton(_ sender: Any) {
        date = dateTimePicker.date
        UIView.animate(withDuration: 0.5) {
            self.alpha = 0
            self.delegate?.dateTime(self, needsPerform: .pickDate(value: self.date))
        }
    }
}

extension CustomDateTimePicker {
    enum Action {
        case pickDate(value: Date)
    }
}
