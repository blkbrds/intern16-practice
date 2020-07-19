//
//  Baitap4ViewController.swift
//  Baitap5
//
//  Created by MBA0245P on 7/15/20.
//  Copyright © 2020 Tran Thao Nguyen. All rights reserved.
//

import UIKit

class Baitap4ViewController: UIViewController {

    @IBOutlet weak var dateInputTextField: UITextField!

    var datePicker: DatePickerView = DatePickerView()

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let newdatePicker = (Bundle.main.loadNibNamed("DatePickerView", owner: nil, options: nil)?.first as? DatePickerView) else { return }
        datePicker = newdatePicker

        view.addSubview(datePicker)
        datePicker.isHidden = true

        datePicker.frame.origin.y = view.frame.height - datePicker.frame.height
//        dateInputTextField.inputView = datePicker
//        dateInputTextField.delegate = self
        datePicker.delegate = self

    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        view.endEditing(true)
        UIView.transition(with: self.datePicker, duration: 3, options: .transitionCurlDown, animations: {
            self.datePicker.isHidden = true
            self.view.layoutIfNeeded()
        })
    }
}

extension Baitap4ViewController: DatePickerViewDelegate {
    func datePickerView(_ datePickerView: DatePickerView, needsPerform action: DatePickerView.Action) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        switch action {
        case .selectedDate(let selectedDate):
            dateInputTextField.text = dateFormatter.string(from: selectedDate)
        }
    }
}

extension Baitap4ViewController: UITextFieldDelegate {
    func dateInputTextFieldEditingDibBegin(_ textField: UITextField) -> Bool {
        UIView.transition(with: self.datePicker, duration: 3, options: .transitionCurlUp, animations: {
            self.datePicker.isHidden = false
            self.view.layoutIfNeeded()
        })
        return false
    }

}
