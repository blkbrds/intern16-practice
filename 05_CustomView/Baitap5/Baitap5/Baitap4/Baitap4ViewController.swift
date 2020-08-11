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
        configDatePickerView()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(withDuration: 3, delay: 0, options: .transitionCurlDown, animations: {
            self.datePicker.isHidden = true
            self.view.layoutIfNeeded()
        }, completion: nil)
    }

    private func configDatePickerView() {
        guard let newdatePicker = (Bundle.main.loadNibNamed("DatePickerView", owner: nil, options: nil)?.first as? DatePickerView) else { return }
        datePicker = newdatePicker
        datePicker.frame = CGRect(x: 0, y: 400, width: view.frame.width, height: 300)
        view.addSubview(datePicker)
        datePicker.isHidden = true
        datePicker.delegate = self
    }
}

extension Baitap4ViewController: DatePickerViewDelegate {
    func view(_ datePickerView: DatePickerView, needsPerform action: DatePickerView.Action) {
        switch action {
        case .didTapDoneButton(selectedDate: let newDate):
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .none
            dateInputTextField.text = dateFormatter.string(from: newDate)
            UIView.animate(withDuration: 3, delay: 0, options: .transitionCurlDown, animations: {
                self.datePicker.isHidden = true
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
    }
}

extension Baitap4ViewController: UITextFieldDelegate {
    func dateInputTextFieldEditingDibBegin(_ textField: UITextField) -> Bool {
        UIView.animate(withDuration: 3, delay: 0, options: .curveEaseIn, animations: {
            self.datePicker.isHidden = false
            self.view.layoutIfNeeded()
        }, completion: nil)
        return false
    }
}
