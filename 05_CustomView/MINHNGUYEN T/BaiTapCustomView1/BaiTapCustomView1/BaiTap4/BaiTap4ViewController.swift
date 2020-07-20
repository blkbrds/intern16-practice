//
//  BaiTap4ViewController.swift
//  BaiTapCustomView1
//
//  Created by MacBook Pro on 7/6/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class BaiTap4ViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak private var datetimeTextField: UITextField!

    // MARK: - Properties
    private var datePickerView: DatePickerView?
    private let dateFormater: DateFormatter = DateFormatter()

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        datePickerView = Bundle.main.loadNibNamed("DatePickerView", owner: nil, options: nil)?.first as? DatePickerView
        guard let datePicker = datePickerView else { return }
        datePicker.frame = CGRect(x: 0, y: UIScreen.main.bounds.height - datePicker.frame.height, width: UIScreen.main.bounds.width, height: datePicker.frame.height)
        datePicker.delegate = self
        view.addSubview(datePicker)
        datetimeTextField?.delegate = self
        datePicker.isHidden = true
    }

    // MARK: - Override funtions
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        datePickerView?.isHidden = true
    }
}

// MARK: - DatePickerViewDelegate
extension BaiTap4ViewController: DatePickerViewDelegate {
    func doneTime(_ view: DatePickerView, needsPerform action: DatePickerView.Action) {
        switch action {
        case .didClickDatePicker(date: let date):
            dateFormater.dateFormat = "MMM dd, yyyy"
            datetimeTextField.text = dateFormater.string(from: date)
            datePickerView?.isHidden = true
        }
    }
}

// MARK: - UITextFieldDelegate
extension BaiTap4ViewController : UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        datePickerView?.isHidden = false
        return false
    }
}
