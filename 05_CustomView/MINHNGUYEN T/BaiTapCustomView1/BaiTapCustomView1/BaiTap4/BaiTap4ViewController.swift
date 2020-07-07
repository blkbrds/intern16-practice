//
//  BaiTap4ViewController.swift
//  BaiTapCustomView1
//
//  Created by MacBook Pro on 7/6/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit


class BaiTap4ViewController: UIViewController {
    

    @IBOutlet weak var datetimeTextField: UITextField!
        var datePicker: DatePickerView!
        let dateFormater: DateFormatter = DateFormatter()
    
        override func viewDidLoad() {
            super.viewDidLoad()
              datePicker = Bundle.main.loadNibNamed("DatePickerView", owner: nil, options: nil)?.first as? DatePickerView
            view.addSubview(datePicker)
            //datePicker.frame.origin.y = view.frame.height - datePicker.frame.height
            datePicker.frame = CGRect(x: 0, y: view.frame.height - datePicker.frame.height, width: view.frame.width, height: view.frame.height)
            datetimeTextField.delegate = self
            datePicker.delegate = self
        }
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            view.endEditing(true)
        }
    }

extension BaiTap4ViewController: UITextFieldDelegate,CustomDateTimePickerDelegate{
    func dateTime(_ view: DatePickerView, date: Date) {
        dateFormater.dateFormat = "MMM dd, yyyy"
        datetimeTextField.text = dateFormater.string(from: date)
    }
    
    func doneTime(_ view: DatePickerView, date: Date){
        dateFormater.dateFormat = "MMM dd, yyyy"
        datetimeTextField.text = dateFormater.string(from: date)
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        datePicker.isHidden = false
        return true
    }
}
