//
//  EditViewController.swift
//  BaitapNavigation
//
//  Created by PCI0001 on 7/21/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

// MARK: - Protocol
protocol EditViewDelegate: class {
    func updateUser(view: EditViewController, user: String)
}

final class EditViewController: UIViewController {
    
    // MARK: - IBOulets
    @IBOutlet private weak var userNameTextField: UITextField!
    
    // MARK: - Properties
    var user: String = ""
    weak var delegate: EditViewDelegate?
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    // MARK: - Private methods
    private func configUI() {
        title = "Edit"
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(popLoginTouchUpInside))
        navigationItem.leftBarButtonItem = cancelButton
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(popLoginTouchUpInside))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    @objc private func popLoginTouchUpInside() {
        navigationController?.popViewController(animated: true)
        if let delegate = delegate {
            delegate.updateUser(view: self, user: userNameTextField.text!)
        }
    }
}
