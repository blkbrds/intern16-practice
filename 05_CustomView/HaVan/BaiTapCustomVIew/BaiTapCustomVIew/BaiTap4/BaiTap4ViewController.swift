//
//  BaiTap4ViewController.swift
//  BaiTapCustomVIew
//
//  Created by NganHa on 7/7/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

final class BaiTap4ViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet private weak var dateTextField: UITextField!
    
    // MARK: - Propeties
    private var newDatePicker: MyDatePickerView?
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configDatePicker()
    }
    
    // MARK: - Private functions
    private func configDatePicker() {
        newDatePicker = Bundle.main.loadNibNamed("MyDatePickerView", owner: self, options: nil)?.first as? MyDatePickerView
        newDatePicker?.frame = CGRect(x: 0, y: 400, width: view.frame.width, height: 300)
        newDatePicker?.delegateDate = self
        dateTextField.delegate = self
        self.newDatePicker?.isHidden = true
        view.addSubview(newDatePicker!)
    }
    
    // MARK: - Public functions
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(withDuration: 5.0, delay: 0.0, options: .transitionCurlDown, animations: {
            self.newDatePicker?.isHidden = true
        }, completion: nil)
    }
}

//MARK: -Extension
extension BaiTap4ViewController: MyDatePickerViewDelegate {
    func view(_ datePickerView: MyDatePickerView, needsPerform action: MyDatePickerView.Action) {
        switch action {
        case .didTapButtonDone(getDate: let newDate):
             let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "MMMM dd yyyy"
                    dateTextField.text = dateFormatter.string(from: newDate)
            UIView.animate(withDuration: 5.0, delay: 0.0, options: .transitionCurlDown, animations: {
                self.newDatePicker?.isHidden = true
            }, completion: nil)
        }
    }
}

extension BaiTap4ViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        UIView.animate(withDuration: 5.0, delay: 0.0, options: .curveEaseIn, animations: {
            self.newDatePicker?.isHidden = false
        }, completion: nil)
        return false
    }
    
}
