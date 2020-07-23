//
//  ProfileViewController.swift
//  BaitapNavigation
//
//  Created by PCI0001 on 7/22/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    // MARK: - IBOulets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    // MARK: - Properties
    var username: String = ""
    var image: UIImage?
    var index: Int = 0
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    // MARK: - Private methods
    private func configUI() {
        title = "Profile"
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(popHomeViewTouchUpInside))
        navigationItem.rightBarButtonItem = doneButton
        nameTextField.text = username
        avatarImageView.image = image
        }
    
    @objc private func popHomeViewTouchUpInside() {
        navigationController?.popToRootViewController(animated: true)
    }
}
