//
//  ProfileViewController.swift
//  Navigation
//
//  Created by MacBook Pro on 7/22/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

protocol ProfileViewControllerDelegate: class {
    func changeNameUser(_ controller: ProfileViewController, needsPerfrom action: ProfileViewController.Action)
}

final class ProfileViewController: UIViewController {

    // MARK: - IBOulets
    @IBOutlet private weak var nameUserTextFiled: UITextField!
    @IBOutlet private weak var userImageView: UIImageView!
    
    // MARK: - Properties
    weak var delegate: ProfileViewControllerDelegate?
    var username = ""
    weak var nameImage: UIImage?
    var index: Int = 0
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        navigationController?.navigationBar.backgroundColor = . red
        nameUserTextFiled.text = username
        userImageView.image = nameImage
        configDoneButton()
    }
    
    // MARK: - Private funtions
    private func configDoneButton() {
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(clickDoneButton))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    // MARK: - Objc funtions
    @objc private func clickDoneButton() {
        guard let newNameUser = nameUserTextFiled.text else { return }
        delegate?.changeNameUser(self, needsPerfrom: .changNameUser(username: newNameUser , index: index))
        navigationController?.popViewController(animated: true)
    }
}

extension ProfileViewController {
    enum Action{
        case changNameUser(username: String, index: Int)
    }
}
