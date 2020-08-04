//
//  CustomInsertViewController.swift
//  BaiTapTableView
//
//  Created by NganHa on 7/31/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

protocol CustomInsertViewControllerDelegate: class {
    func controller(_ controller : CustomInsertViewController, needsPerform action: CustomInsertViewController.Action)
}

final class CustomInsertViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var addTextField: UITextField!
    
    // MARK: - Propeties
    weak var delegate: CustomInsertViewControllerDelegate?
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addTextField.delegate = self
    }
    
    // MARK: - Objc functions
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        addTextField.resignFirstResponder()
    }
    
    // MARK: - IBActions
    @IBAction private func doneButtonTouchUpInside(_ sender: UIButton) {
        guard let textContent = addTextField.text else { return }
        delegate?.controller(self, needsPerform: .sendTextfield(text: textContent))
    }
    
    @IBAction private func cancelButtonTouchUpInside(_ sender: UIButton) {
        delegate?.controller(self, needsPerform: .cancel)
    }
}

// MARK: - Extension
extension CustomInsertViewController {
    enum Action {
        case sendTextfield(text: String)
        case cancel
    }
}

// MARK: - UITextFieldDelegate
extension CustomInsertViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let textContent = addTextField.text else { return true }
        textField.resignFirstResponder()
        delegate?.controller(self, needsPerform: .sendTextfield(text: textContent))
        return true
    }
}
