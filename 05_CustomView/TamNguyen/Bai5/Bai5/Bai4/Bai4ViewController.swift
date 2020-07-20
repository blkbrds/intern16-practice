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
    @IBOutlet private weak var dateTextField: UITextField!
    
    // MARK: - Properties
    private var datePickerView: DatePickerView!
    private let dateFormater: DateFormatter = DateFormatter()
    
    // MARK: - Lyfe Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    //MARK: - Private methods
    private func configUI() {
        datePickerView = Bundle.main.loadNibNamed("DatePickerView", owner: nil, options: nil)?.first as? DatePickerView
        datePickerView.frame = CGRect(x: 0, y: view.frame.height - datePickerView.frame.height, width: view.frame.width, height: datePickerView.frame.height)
        datePickerView.delegate = self
        view.addSubview(datePickerView)
        dateTextField.delegate = self
        datePickerView.isHidden = true
        dateTextField.textAlignment = .center    }
    
    //MARK: - Override function
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        datePickerView.isHidden = true
        
    }
}

// MARK: - DatePickerViewDelegate
extension Bai4ViewController: DatePickerViewDelegate {
    func doneTime(_ view: DatePickerView, needsPerform action: DatePickerView.Action) {
        switch action {
        case .didClickDatePicker(date: let date):
            dateFormater.dateFormat = "MMM dd, yyyy"
            dateTextField.text = dateFormater.string(from: date)
            datePickerView.isHidden = true
        }
    }
}

// MARK: - UITextFieldDelegate
extension Bai4ViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        datePickerView.isHidden = false
        return false
    }
}
