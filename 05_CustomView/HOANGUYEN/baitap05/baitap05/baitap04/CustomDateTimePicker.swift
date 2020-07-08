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
    func dateTime(_ view: CustomDateTimePicker, date: Date)
}

class CustomDateTimePicker: UIView {
    
    // MARK: - IBOutlets
    @IBOutlet weak var dateTimePicker: UIDatePicker!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var containButtonUIView: UIView!
    // MARK: - Propeties
    weak var delegate: CustomDateTimePickerDelegate?
    let dateFormater: DateFormatter = DateFormatter()
    var dateValue: String = ""
    var date: Date = Date()
    
    // MARK: - Life cycle
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - IBActions
    @IBAction func actionDateTimePicker(_ sender: Any) {
        date = dateTimePicker.date
        dateFormater.dateFormat = "MMM dd, yyyy"
        dateValue = dateFormater.string(from: date)
    }
    
    @IBAction func actionDoneButton(_ sender: Any) {
        UIView.animate(withDuration: 0.5) {
            self.alpha = 0
            print(self.date)
            self.delegate?.dateTime(self, date: self.date)
        }
    }
}
