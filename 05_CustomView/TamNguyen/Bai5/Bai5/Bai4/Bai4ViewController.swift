//
//  Bai4ViewController.swift
//  Bai5
//
//  Created by PCI0001 on 7/7/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

final class Bai4ViewController: UIViewController {
    
    //MARK: - IBOulets
@IBOutlet weak var dateTextField: UITextField!
    
    // MARK: - Propeties
        private var newDatePicker: DatePickerView?

        // MARK: - Life cycle
        override func viewDidLoad() {
            super.viewDidLoad()
            configDatePicker()
        }

        // MARK: - Private functions
        private func configDatePicker() {
            private func configDatePicker() {
                newDatePicker = Bundle.main.loadNibNamed("DatePickerView", owner: self, options: nil)?.first as? DatePickerView
                newDatePicker?.frame = CGRect(x: 0, y: 400, width: view.frame.width, height: 300)
                newDatePicker?.delegateDate = self
                dateTextField.delegate = self
                self.newDatePicker?.isHidden = true
                view.addSubview(newDatePicker!)
            }
        }

        // MARK: - Public functions
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            UIView.animate(withDuration: 5.0, delay: 0.0, options: .transitionCurlDown, animations: {
                self.newDatePicker?.isHidden = true
            }, completion: nil)
        }
    }

    //MARK: -Extension
    extension Bai4ViewController: DatePickerView {
        func view(_ datePickerView: DatePickerView, needsPerform action: DatePickerView.Action) {
            switch action {
            case .didTapButtonDone(getDate: let newDate):
                dateTextField.text = newDate
                UIView.animate(withDuration: 5.0, delay: 0.0, options: .transitionCurlDown, animations: {
                    self.newDatePicker?.isHidden = true
                }, completion: nil)
            }
        }
    }

    extension Bai4ViewController: UITextFieldDelegate {
        func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
            UIView.animate(withDuration: 5.0, delay: 0.0, options: .curveEaseIn, animations: {
                self.newDatePicker?.isHidden = false
            }, completion: nil)
            return false
        }
}
    


