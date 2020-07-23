//
//  Profile1ViewController.swift
//  Bai3Navigation
//
//  Created by Trung Le D. on 7/23/20.
//  Copyright © 2020 Trung Le D. All rights reserved.
//

import UIKit
protocol ProfileViewControllerDelegate1 {
    func updateAvatarTextField(userName: String, index: Int)
}
class Profile1ViewController: UIViewController {
    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var avatarTextField: UITextField!
   var userName: String = ""
    var imageView: String = ""
    var index: Int?
    var profileViewControllerDelegate1: ProfileViewControllerDelegate1?
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        updateUI()
        configNavigationBar()
        // Do any additional setup after loading the view.
    }
    func configNavigationBar() {
        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backTouchUpInSide))
        navigationItem.leftBarButtonItem = backButton
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneButtonTouchUpInSide))
        navigationItem.rightBarButtonItem = doneButton
    }
    @objc func backTouchUpInSide() {
        if let navigationController = navigationController {
            navigationController.popViewController(animated: true)
        }
    }
    
    @objc func doneButtonTouchUpInSide() {
        if let delegate = profileViewControllerDelegate1, let index = index {
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
