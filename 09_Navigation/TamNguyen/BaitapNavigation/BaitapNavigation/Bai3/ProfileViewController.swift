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
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var avatarImageView: UIImageView!
    
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
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(popHomeViewButtonTouchUpInside))
        navigationItem.rightBarButtonItem = doneButton
        nameTextField.text = username
        avatarImageView.image = image
    }
    
    @objc private func popHomeViewButtonTouchUpInside() {
        navigationController?.popToRootViewController(animated: true)
    }
}
