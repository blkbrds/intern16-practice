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
//    var dateString: String = ""
    
// MARK: - Life cycle
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
// MARK: - Private functions
    
// MARK: - Public functions
    
// MARK: - IBActions
    @IBAction func actionDateTimePicker(_ sender: Any) {
        date = dateTimePicker.date
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

// MARK: - extension
extension CustomDateTimePicker: Baitap04ViewControllerDelegate {
    func textFieldToDatePicker(_ view: Baitap04ViewController, date: String) {
        let date = dateFormater.date(from: date)!
        dateTimePicker.setDate(date, animated: true)
    }
}
