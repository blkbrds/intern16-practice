//
//  BaiTap4ViewController.swift
//  BaiTapCustomView1
//
//  Created by MacBook Pro on 7/6/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class BaiTap4ViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var datetimeTextField: UITextField!
    
    // MARK: - Private Properties
    private var datePickerView: DatePickerView!
    private let dateFormater: DateFormatter = DateFormatter()
    
    // MARK: - Lyfe Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        datePickerView = Bundle.main.loadNibNamed("DatePickerView", owner: nil, options: nil)?.first as? DatePickerView
        datePickerView.frame = CGRect(x: 0, y: view.frame.height - datePickerView.frame.height, width: view.frame.width, height: datePickerView.frame.height)
        datePickerView.delegate = self
        view.addSubview(datePickerView)
        datetimeTextField.delegate = self
    }

    // MARK: - TouchesBegan
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        datePickerView.isHidden = true
    }
}

// MARK: - DatePickerViewDelegate
extension BaiTap4ViewController: DatePickerViewDelegate {
    func doneTime(_ view: DatePickerView, needsPerform action: DatePickerView.Action) {
        switch action {
        case .didClickDatePicker(date: let date):
            dateFormater.dateFormat = "MMM dd, yyyy"
            datetimeTextField.text = dateFormater.string(from: date)
            datePickerView.isHidden = true
        }
    }
}

// MARK: - UITextFieldDelegate
extension BaiTap4ViewController : UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        datePickerView.isHidden = false
        return false
    }
}
