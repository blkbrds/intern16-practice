//
//  PickerView.swift
//  CustomView
//
//  Created by PCI0007 on 7/8/20.
//  Copyright © 2020 Chipuscu. All rights reserved.
//

import UIKit

protocol PickerViewDelegate: class {
    func pickerView(_ pickerView: PickerView , didSelect date: String)
}

class PickerView: UIView {
    
    // MARK: - Outlet:
    weak var delegate: PickerViewDelegate?
    var dateString: String = ""
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var doneToolbarView: UIToolbar!

    // MARK: - Functions
    override func awakeFromNib() {
      super.awakeFromNib()
        datePicker.datePickerMode = UIDatePicker.Mode.date
        isHidden = true
    }
    
    @IBAction func datePickerView(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd yyyy"
        let selectedDate = dateFormatter.string(from: datePicker.date)
        dateString = selectedDate
    }
    
    @IBAction func doneButtonTouchUpInside(_ sender: UIBarButtonItem) {
        if let delegate = delegate {
            delegate.pickerView(self, didSelect: dateString)
        }
        isHidden = true
    }
}
