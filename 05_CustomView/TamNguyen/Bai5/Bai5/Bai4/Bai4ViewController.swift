//
//  Bai4ViewController.swift
//  Bai5
//
//  Created by PCI0001 on 7/7/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

protocol Bai4ViewControllerDelegate: class {
    func textFieldToDatePicker(_ view: Bai4ViewController, date: String)
}

class Bai4ViewController: UIViewController {
    
@IBOutlet weak var dateTextField: UITextField!
    
    var dateTimePicker: DatePickerView!
    weak var delegate: Bai4ViewControllerDelegate?
    let dateFormater: DateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateTimePicker = Bundle.main.loadNibNamed("DatePickerView", owner: nil, options: nil)?.first as? DatePickerView
        view.addSubview(dateTimePicker)
        dateTimePicker.frame.origin.y = view.frame.height - dateTimePicker.frame.height
        dateTextField.delegate = self
        dateTimePicker.delegate = self
        // Do any additional setup after loading the view.
    }
    // MARK: - Override function
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            view.endEditing(true)
        }
    }
    
    // MARK: - extension
    extension Bai4ViewController: UITextFieldDelegate, CustomDateTimePickerDelegate {
        func dateTime(_ view: DatePickerView, date: Date) {
            dateFormater.dateFormat = "MMM dd, yyyy"
            dateTextField.text = dateFormater.string(from: date)
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
    


