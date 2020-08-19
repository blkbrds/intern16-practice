//
//  EditViewController.swift
//  BaiTapNavigation
//
//  Created by PCI0004 on 7/22/20.
//  Copyright © 2020 PCI0004. All rights reserved.
//

import UIKit

protocol EditViewControllerDelegate: class {
    func setValue(_ viewController: EditViewController, needsPerform action: EditViewController.Action)
}

final class EditViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var newPasswordTextField: UITextField!
    @IBOutlet private weak var confirmPasswordTextField: UITextField!

    // MARK: - Configure
    private struct Configure {
        static let titleName = "Edit"
    }

    // MARK: - Properties
    weak var delegate: EditViewControllerDelegate?

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Configure.titleName
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
            print("Error")
        }
    }

    @objc private func processDone() {
        guard let username = usernameTextField.text else { return }
        if let delegate = delegate {
            delegate.setValue(self, needsPerform: .setName(name: username))
            navigationController?.popViewController(animated: true)
        }
    }
}

// MARK: - Extension
extension EditViewController {
    enum Action {
        case setName(name: String)
    }
}
