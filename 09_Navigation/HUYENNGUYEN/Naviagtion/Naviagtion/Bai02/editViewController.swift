//  EditViewController.swift
//  Naviagtion

import UIKit

class EditViewController: UIViewController {
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    // MARK: - Function
    private func configView() {
        title = "Edit"
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneTouchUpInside))
        navigationItem.rightBarButtonItem = doneButton
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelTouchUpInside))
        navigationItem.leftBarButtonItem = cancelButton
    }
    
    // MARK: - Objc
    @objc func doneTouchUpInside() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func cancelTouchUpInside() {
        navigationController?.popViewController(animated: true)
    }
}
