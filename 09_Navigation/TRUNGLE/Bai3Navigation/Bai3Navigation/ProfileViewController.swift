//
//  ProfileViewController.swift
//  Bai3Navigation
//
//  Created by Trung Le D. on 7/22/20.
//  Copyright © 2020 Trung Le D. All rights reserved.
//

import UIKit
protocol ProfileViewControllerDelegate {
    func updateAvatarTextField(userName: String, index: Int)
}
class ProfileViewController: UIViewController {
    
    @IBOutlet weak var avatarTextField: UITextField!
    @IBOutlet weak var avatarImageView: UIImageView!
    
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
          let backButton = UIBarButtonItem(title: "<Back", style: .plain, target: self, action: #selector(backTouchUpInSide))
          navigationItem.leftBarButtonItem = backButton
          
          let doneButton = UIBarButtonItem(title: "Done>", style: .plain, target: self, action: #selector(doneButtonTouchUpInSide))
          navigationItem.rightBarButtonItem = doneButton
      }
    @objc func backTouchUpInSide() {
           if let navigationController = navigationController {
               navigationController.popViewController(animated: true)
           }
       }
       
       @objc func doneButtonTouchUpInSide() {
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
