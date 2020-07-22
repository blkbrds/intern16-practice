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
class ProfileViewController: UIViewController {
    
    @IBOutlet private weak var nameUserTextFiled: UITextField!
    @IBOutlet private weak var userImageView: UIImageView!
    weak var delegate: ProfileViewControllerDelegate?
    var username = ""
    var nameImage:UIImage?
    var index:Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        navigationController?.navigationBar.backgroundColor = . red
        nameUserTextFiled.text = username
        userImageView.image = nameImage
        configDoneButton()
    }
    
    private func configDoneButton() {
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(clickDoneButton))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    @objc func clickDoneButton() {
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
