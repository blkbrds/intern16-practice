//
//  EditViewController.swift
//  BaiTapNavigation
//
//  Created by PCI0004 on 7/22/20.
//  Copyright © 2020 PCI0004. All rights reserved.
//

import UIKit

protocol EditViewControllerDelegate: class {
    func setValue(_ editViewController: EditViewController, needsperform action: EditViewController.Action)
}

final class EditViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var newPasswordTextField: UITextField!
    @IBOutlet private weak var confirmPasswordTextField: UITextField!
    weak var delegate: EditViewControllerDelegate?

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Edit"
        configUI()
    }

    // MARK: - Private Funtions
    private func configUI() {
        let newPassword = newPasswordTextField.text
        let confirmPassword = confirmPasswordTextField.text
        if newPassword == confirmPassword {
            let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(processDone))
            navigationItem.rightBarButtonItem = doneButton
        } else {
            print("Eror")
        }
    }

    @objc private func processDone() {
        guard let username = usernameTextField.text else { return }
        delegate?.setValue(self, needsperform: .setName(name: username))
        navigationController?.popViewController(animated: true)
    }
}

extension EditViewController {
    enum Action {
        case setName(name: String)
    }
}
