//
//  Profile1ViewController.swift
//  Bai3Navigation
//
//  Created by Trung Le D. on 7/23/20.
//  Copyright © 2020 Trung Le D. All rights reserved.
//

import UIKit
protocol ProfileViewControllerDelegate {
    func updateAvatarTextField(userName: String, index: Int)
}
class ProfileViewController: UIViewController {
    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var avatarTextField: UITextField!
    var userName: String = ""
    var imageView: String = ""
    var index: Int?
    var profileViewControllerDelegate: ProfileViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        updateUI()
        configNavigationBar()
        // Do any additional setup after loading the view.
    }
    func configNavigationBar() {
 
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonClick))
        navigationItem.rightBarButtonItem = doneButton
    }
    @objc func doneButtonClick() {
        if let delegate = profileViewControllerDelegate, let index = index {
            delegate.updateAvatarTextField(userName: avatarTextField.text ?? "", index: index)
        }
        if let navigationController = navigationController {
            navigationController.popViewController(animated: true)
        }
    }
    private func updateUI() {
        avatarTextField.text = userName
        avatarImageView.image = UIImage(named: imageView)
    }
}
