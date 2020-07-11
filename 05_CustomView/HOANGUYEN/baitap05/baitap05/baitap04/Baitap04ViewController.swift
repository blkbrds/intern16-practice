//
//  Baitap04ViewController.swift
//  baitap05
//
//  Created by NXH on 7/5/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

final class Baitap04ViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var dateTimeTextField: UITextField!
    
    // MARK: - Properties
    var dateTimePicker: CustomDateTimePicker!
    let dateFormater: DateFormatter = DateFormatter()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        dateTimePicker = Bundle.main.loadNibNamed("CustomDateTimePicker", owner: nil, options: nil)?.first as? CustomDateTimePicker
        view.addSubview(dateTimePicker)
        dateTimePicker.alpha = 0
        dateTimePicker.frame.origin.y = view.frame.height - dateTimePicker.frame.height
        dateTimeTextField.delegate = self
        dateTimePicker.delegate = self
    }
}

// MARK: - extension
extension Baitap04ViewController: UITextFieldDelegate, CustomDateTimePickerDelegate {
    func dateTime(_ view: CustomDateTimePicker, needsPerform: CustomDateTimePicker.Action) {
        dateFormater.dateFormat = "MMM dd, yyyy"
        switch needsPerform {
        case .pickDate(let date):
            dateTimeTextField.text =  dateFormater.string(from: date)
        }
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        UIView.animate(withDuration: 0.5) {
            self.dateTimePicker.alpha = 1
        }
        return false
    }
}
