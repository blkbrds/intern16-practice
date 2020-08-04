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
    @IBOutlet private weak var personImageView: UIImageView!
    @IBOutlet private weak var nameTextField: UITextField!
    
    // MARK: - Propeties
    var imageName: String = ""
    var name: String = ""
    var index: Int?
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
        nameTextField.resignFirstResponder()
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
        guard let name = nameTextField.text else { return }
        guard let index = index else { return }
        delegate?.controller(self, needsPerform: .changeValue(index: index, newName: name))
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Objc functions
    @objc private func backToHomeViewController() {
        backHome()
    }
}

//MARK: - Extension
extension ProfileViewController {
    enum Action {
        case changeValue(index: Int, newName: String)
    }
}

//MARK: - UITextFieldDelegate
extension ProfileViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        backHome()
        return true
    }
}
