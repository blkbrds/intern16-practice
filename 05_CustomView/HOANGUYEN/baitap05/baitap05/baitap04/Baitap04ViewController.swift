//
//  Baitap04ViewController.swift
//  baitap05
//
//  Created by NXH on 7/5/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

protocol Baitap04ViewControllerDelegate: class {
    func textFieldToDatePicker(_ view: Baitap04ViewController, date: String)
}

class Baitap04ViewController: UIViewController {
    
// MARK: - IBOutlet
    @IBOutlet weak var dateTimeTextField: UITextField!
    
// MARK: - Properties
    var dateTimePicker: CustomDateTimePicker!
    weak var delegate: Baitap04ViewControllerDelegate?
    let dateFormater: DateFormatter = DateFormatter()
    
// MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
          dateTimePicker = Bundle.main.loadNibNamed("CustomDateTimePicker", owner: nil, options: nil)?.first as? CustomDateTimePicker
        view.addSubview(dateTimePicker)
        dateTimePicker.frame.origin.y = view.frame.height - dateTimePicker.frame.height
        dateTimeTextField.delegate = self
        dateTimePicker.delegate = self
        self.delegate = dateTimePicker
    }
// MARK: - Override function
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

// MARK: - extension
extension Baitap04ViewController: UITextFieldDelegate, CustomDateTimePickerDelegate {
    func dateTime(_ view: CustomDateTimePicker, date: Date) {
        dateFormater.dateFormat = "MMM dd, yyyy"
        dateTimeTextField.text = dateFormater.string(from: date)
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        UIView.transition(with: dateTimePicker, duration: 0.5, options: .transitionCurlDown, animations: {
            self.dateTimePicker.alpha = 1
        }, completion: nil)
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        delegate?.textFieldToDatePicker(self, date: textField.text!)
        view.endEditing(true)
        return true
    }
}

