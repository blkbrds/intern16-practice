//
//  PickerView.swift
//  CustomView
//
//  Created by PCI0007 on 7/8/20.
//  Copyright © 2020 Chipuscu. All rights reserved.
//

import UIKit

protocol PickerViewDelegate: class {
    func pickerView(_ pickerView: MyDatePickerView , didSelect date: Date)
}

class MyDatePickerView: UIView {
    
    // MARK: - Outlet:
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var doneToolbarView: UIToolbar!
    weak var delegate: PickerViewDelegate?
    var dateString: String = ""

    // MARK: - Functions
    override func awakeFromNib() {
      super.awakeFromNib()
        datePicker.datePickerMode = UIDatePicker.Mode.date
        isHidden = true
    }
    
    @IBAction func datePickerView(_ sender: UIDatePicker) { }
    
    @IBAction func doneButtonTouchUpInside(_ sender: UIBarButtonItem) {
        if let delegate = delegate {
            delegate.pickerView(self, didSelect: datePicker.date)
        }
        isHidden = true
    }
}
