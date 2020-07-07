//
//  DatePickerView.swift
//  BaiTapCustomView1
//
//  Created by MacBook Pro on 7/6/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

protocol CustomDateTimePickerDelegate: class {
    func dateTime(_ view: DatePickerView, date: Date)
    func doneTime(_ view: DatePickerView, date: Date)
}
class DatePickerView: UIView {
    @IBOutlet weak var dateTimePicker: UIDatePicker!
        @IBOutlet weak var doneButton: UIButton!
        @IBOutlet weak var containButtonUIView: UIView!
    
        weak var delegate: CustomDateTimePickerDelegate?
        let dateFormater: DateFormatter = DateFormatter()
        var dateValue: String = ""
        var date: Date = Date()
        
        override class func awakeFromNib() {
            super.awakeFromNib()
        }
        
        @IBAction func actionDateTimePicker(_ sender: Any) {
            date = dateTimePicker.date
            dateFormater.dateFormat = "MMM dd, yyyy"
            dateValue = dateFormater.string(from: date)
            delegate?.dateTime(self, date: date)
        }
        
        @IBAction func actionDoneButton(_ sender: Any) {
            date = dateTimePicker.date
            dateFormater.dateFormat = "MMM dd, yyyy"
            dateValue = dateFormater.string(from: date)
            delegate?.doneTime(self, date: date)
            self.isHidden = true
        }
}
