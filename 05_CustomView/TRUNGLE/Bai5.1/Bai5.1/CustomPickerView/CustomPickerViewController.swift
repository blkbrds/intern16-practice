//
//  CustomPickerViewController.swift
//  Bai5.1
//
//  Created by Abcd on 7/7/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import UIKit

final class CustomPickerViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    var customPickerView : CustomPickerView?
    override func viewDidLoad() {
        super.viewDidLoad()
        customPickerView = Bundle.main.loadNibNamed( "CustomPickerView", owner: self, options: nil)?.first as? CustomPickerView
        guard let customPickerView = customPickerView else { return }
        customPickerView.config()
        customPickerView.delegate = self
        view.addSubview(customPickerView)
        textField.delegate = self
    }
}
extension CustomPickerViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        guard let customPickerView = customPickerView else { return }
        customPickerView.show(animation: true)
        view.endEditing(true)
    }
}
extension CustomPickerViewController: CustomePickerViewDelegate {
    func selectDate(datePicker pickerView: CustomPickerView, needsPerformAction action: CustomPickerView.Action, selectDate: Date?) {
        guard let date = selectDate else { return }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let dateString = dateFormatter.string(from: date)
        textField.text = dateString
        print(dateString)
    }
}
