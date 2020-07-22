//
//  ProfileViewController.swift
//  BaiTapNavigation
//
//  Created by NganHa on 7/22/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

protocol ProfileViewControllerDelegate: class {
    func controller(_ viewController: ProfileViewController, needsPerform action: ProfileViewController.Action)
}

final class ProfileViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var personImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    
    // MARK: - Propeties
    var imageName: String = ""
    var name: String = ""
    weak var delegate: ProfileViewControllerDelegate?
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigationBar()
        configProfile()
        nameTextField.delegate = self
    }
    // MARK: - Override functions
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    // MARK: - Private functions
    private func configNavigationBar() {
        title = "Profile"
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(backToHomeViewController))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    private func configProfile() {
        personImageView.image = UIImage(named: imageName)
        nameTextField.text = name
    }
    
    private func backHome() {
        guard let name = nameTextField.text else {
            return
        }
        delegate?.controller(self, needsPerform: .changeValue(name: name))
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Objc functions
    @objc func backToHomeViewController() {
        backHome()
    }
}

//MARK: -Extension
extension ProfileViewController {
    enum Action {
        case changeValue(name: String)
    }
}

//MARK: -TextFieldDelegate
extension ProfileViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        backHome()
        return true
    }
}
