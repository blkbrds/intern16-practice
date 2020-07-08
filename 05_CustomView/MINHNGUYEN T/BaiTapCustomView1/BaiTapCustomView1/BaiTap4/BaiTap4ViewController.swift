//
//  BaiTap4ViewController.swift
//  BaiTapCustomView1
//
//  Created by MacBook Pro on 7/6/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class BaiTap4ViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - IBOutlet
    @IBOutlet weak var datetimeTextField: UITextField!
    
    // MARK: - Private Properties
    private var datePicker: DatePickerView!
    private let dateFormater: DateFormatter = DateFormatter()
    
    // MARK: - Lyfe Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker = Bundle.main.loadNibNamed("DatePickerView", owner: nil, options: nil)?.first as? DatePickerView
        datePicker.frame = CGRect(x: 0, y: view.frame.height - datePicker.frame.height, width: view.frame.width, height: view.frame.height)
        datePicker.delegate = self
        //datetimeTextField.inputView = datePicker
        view.addSubview(datePicker)
        datetimeTextField.delegate = self
        //datePicker.isHidden = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        datePicker.isHidden = true
    }

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        datePicker.isHidden = false
        return false
    }
}

extension BaiTap4ViewController: CustomDateTimePickerDelegate{
    func doneTime(_ view: DatePickerView, needsPerform action: DatePickerView.Action) {
        switch action {
        case .didClickDatePicker(date: let date):
            dateFormater.dateFormat = "MMM dd, yyyy"
            datetimeTextField.text = dateFormater.string(from: date)
            datePicker.isHidden = true
        }
    }
}
