//
//  ProfileViewController.swift
//  baitap09
//
//  Created by NXH on 7/16/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit
// MARK: - Protocol
protocol ProfileViewControllerDelegate: class {
    func view(_ controller: ProfileViewController, needsPerform action: ProfileViewController.Action)
}

final class ProfileViewController: UIViewController {
    
    // MARK: - Properties
    let userDefaults: UserDefaults = UserDefaults()
    var nameTextField: UITextField = {
        let textField: UITextField = UITextField()
        textField.bounds.size.width = 200
        textField.bounds.size.height = 50
        textField.textColor = .black
        textField.layer.borderColor = UIColor.blue.cgColor
        textField.layer.cornerRadius = 5
        textField.layer.borderWidth = 1
        return textField
    }()
    
    weak var delegate: ProfileViewControllerDelegate?
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        view.backgroundColor = .white
        configButtonBar()
        viewProfile()
        nameTextField.delegate = self
    }
    
    // MARK: - Override Function
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    // MARK: - Private Function
    
    private func configButtonBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(tapOnDoneButton))
    }
    
    private func viewProfile(){
        if let name: String = userDefaults.value(forKey: "name") as? String, let avatar: String = userDefaults.value(forKey: "avatar") as? String {
            let person: User = User(nameUser: name, avatarUser: avatar)
            let user: Avatar = Avatar(frame: CGRect(x: UIScreen.main.bounds.width / 2 - 50, y: 100, width: 100, height: 130), user: person, index: 0)
            user.nameLabel.isHidden = true
            view.addSubview(user)
            nameTextField.center.x = user.center.x
            nameTextField.frame.origin.y = user.frame.maxY + 30
            nameTextField.text = name
            view.addSubview(nameTextField)
        }
    }
    
    // MARK: - Objc Function
    @objc private func tapOnDoneButton() {
        if let nameText = nameTextField.text {
            userDefaults.set(nameText, forKey: "newName")
            delegate?.view(self, needsPerform: .tap)
        }
        navigationController?.popViewController(animated: true)
    }
}

extension ProfileViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}
extension ProfileViewController {
    enum Action {
        case tap
    }
}
