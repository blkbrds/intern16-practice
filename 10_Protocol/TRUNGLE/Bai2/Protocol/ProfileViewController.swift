//
//  ProfileViewController.swift
//  Protocol
//
//  Created by Trung Le D. on 7/24/20.
//  Copyright © 2020 Trung Le D. All rights reserved.
//

import UIKit

protocol ProfileViewControllerDelegate: class {
    func controller(controller: ProfileViewController, needPerfomAction action: ProfileViewController.Action)
}

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    var userName: String = ""
    var imageView: String = ""
    var index: Int?
    weak var profileViewControllerDelegate: ProfileViewControllerDelegate?
    
    enum Action {
        case updateData(userName: String?, index: Int)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateName()
        configNavigationBar()
        // Do any additional setup after loading the view.
    }
    
    func configNavigationBar() {
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneButtonTouchUpInSide))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    @objc func doneButtonTouchUpInSide() {
        if let delegate = profileViewControllerDelegate, let index = index {
            delegate.controller(controller: self, needPerfomAction: .updateData(userName: nameTextField.text, index: index))
        }
        if let navigation = navigationController {
            navigation.popToRootViewController(animated: true)
        }
    }
    
    func updateName(){
        nameTextField.text = userName
        avatarImageView.image = UIImage(named: imageView)
    }
    
}
