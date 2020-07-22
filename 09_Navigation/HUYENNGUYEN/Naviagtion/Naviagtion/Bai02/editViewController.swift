//  EditViewController.swift
//  Naviagtion

import UIKit

class EditViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    private func configView(){
        title = "Edit"
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneTouchUpInside))
        navigationItem.rightBarButtonItem = doneButton
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelTouchUpInside))
        navigationItem.leftBarButtonItem = cancelButton
    }
    
    @objc func doneTouchUpInside(){
        navigationController?.popViewController(animated: true)
    }
    @objc func cancelTouchUpInside(){
        navigationController?.popViewController(animated: true)
    }
}
