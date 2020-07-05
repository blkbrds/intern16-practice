//
//  DatePickerView.swift
//  BaiTap05
//
//  Created by PCI0020 on 7/1/20.
//  Copyright © 2020 hieu.ngq. All rights reserved.
//

import UIKit

class DatePickerView: UIView {

    weak var delegate: DatePickerViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupDatePicker()
    }
    var dateValue:String?
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupDatePicker() {
        let datePicker = UIDatePicker()
        let datePickerFrame = CGRect(x: frame.origin.x, y: 50 , width: frame.size.width, height: frame.size.height - 50)
        datePicker.addTarget(self, action: #selector(getDateChange), for: .valueChanged)
        datePicker.datePickerMode = .date
        datePicker.center = self.center
        datePicker.frame = datePickerFrame
        datePicker.backgroundColor = #colorLiteral(red: 0.7838097215, green: 0.79557693, blue: 0.8287402987, alpha: 1)
        addSubview(datePicker)
        
        let doneButtonView = UIView()
        let doneButtonViewFrame = CGRect(x: frame.origin.x, y: 0, width: frame.size.width, height: 50)
        doneButtonView.backgroundColor = #colorLiteral(red: 0.9685223699, green: 0.9686879516, blue: 0.9685119987, alpha: 1)
        doneButtonView.frame = doneButtonViewFrame
        addSubview(doneButtonView)
        
        let doneButton = UIButton()
        let doneButtonFrame = CGRect(x: 16, y: 16, width: 64, height: 32)
        doneButton.frame = doneButtonFrame
        doneButton.setTitle("Done", for: .normal)
        doneButton.setTitleColor(.blue, for: .normal)
        doneButton.addTarget(self, action: #selector(getDate), for: .touchUpInside)
        addSubview(doneButton)
        
    }
    @objc func getDateChange(sender:UIDatePicker) {
        let formatter = DateFormatter()
        formatter.calendar = sender.calendar
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        let dateString = formatter.string(from: sender.date)
        self.dateValue = dateString
    }
    @objc func getDate(){
        if let date = dateValue {
            delegate?.setData(self, forTf: date)
            UIView.animate(withDuration: 0.5) {
                self.frame.origin.y = UIScreen.main.bounds.size.height
            }
        }
    }
}
protocol DatePickerViewDelegate: class {
    func setData(_ view: DatePickerView,forTf data: String)
}
