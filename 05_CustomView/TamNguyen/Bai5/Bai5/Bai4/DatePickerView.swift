//
//  DatePickerView.swift
//  Bai5
//
//  Created by PCI0001 on 7/7/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit
// MARK: - Protocol
protocol CustomDateTimePickerDelegate: class {
    func dateTime(_ view: DatePickerView, date: Date)
}

class DatePickerView: UIView {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var containButtonView: UIView!
     
    weak var delegate: CustomDateTimePickerDelegate?
       let dateFormater: DateFormatter = DateFormatter()
       var dateValue: String = ""
       var date: Date = Date()
    
    // MARK: - Life cycle
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func actionPicker(_ sender: Any) {
        date = datePicker.date
        dateFormater.dateFormat = "MMM dd, yyyy"
        dateValue = dateFormater.string(from: date)
        print(dateValue)
        print(date)
        delegate?.dateTime(self, date: date)
        }
    
    @IBAction func actionDoneButton(_ sender: Any) {
        UIView.transition(with: self, duration: 0.5, options: .transitionCurlDown, animations: {
                self.alpha = 0
            }, completion: nil)
    
        }
}
