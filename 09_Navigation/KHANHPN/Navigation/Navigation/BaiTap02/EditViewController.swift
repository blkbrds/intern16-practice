//
//  EditView.swift
//  Navigation
//
//  Created by PCI0007 on 7/16/20.
//  Copyright © 2020 Chipuscu. All rights reserved.
//

import UIKit

final class EditViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var confirmTextField: UITextField!
    @IBOutlet weak var wrongLabel: UILabel!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Edit"
        setupEditFunction()
        dismissKey()
    }
    
    // MARK: - Private function
    private func setupEditFunction() {
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .done, target: self, action: #selector(cancelTouchUpInside))
        navigationItem.leftBarButtonItem = cancelButton
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneEditingTouchUpInside))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    @IBAction private func cancelTouchUpInside(_ sender: UIBarButtonItem) {
            self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction private func doneEditingTouchUpInside(_ sender: UIBarButtonItem) {
        if let path = Bundle.main.path(forResource: "Data", ofType: "plist") {
            if let dic = NSDictionary(contentsOfFile: path) as? [String: String] {
                for user in dic {
                    if usernameTextField.text == user.key {
                        if newPasswordTextField.text == confirmTextField.text {
                            if let dataDictionary = NSMutableDictionary(contentsOfFile: path),
                                let userName = usernameTextField.text,
                                let newPassword = newPasswordTextField.text {
                                dataDictionary[userName] = newPassword
                                dataDictionary.write(toFile: path, atomically: true)
                                let homeView = HomeViewController()
                                homeView.name = "Changing password successful!"
                                self.navigationController?.pushViewController(homeView, animated: true)
                            }
                        }
                    }
                    else {
                        wrongLabel.text = "Wrong username"
                        wrongLabel.isHidden = false
                    }
                }
            }
        }
    }
    
    private func dismissKey() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer( target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
}
