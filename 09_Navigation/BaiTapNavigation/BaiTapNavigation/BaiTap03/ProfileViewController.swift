//
//  ProfileViewController.swift
//  BaiTapNavigation
//
//  Created by PCI0004 on 7/22/20.
//  Copyright © 2020 PCI0004. All rights reserved.
//

import UIKit

protocol ProfileViewControllerDelegate {
    func changeUser(_ profile: ProfileViewController, changeName action: ProfileViewController.Action)
}

final class ProfileViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var avatarImageView: UIImageView!

    // MARK: - Properties
    var name: String = ""
    var imageName: UIImage?
    var index: Int = 0
    var delegate: ProfileViewControllerDelegate?
    
    // MARK: - Configure
    private struct Configure {
        static let titleDoneButton = "Done"
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }

    // MARK: - Private Function
    private func configUI() {
        let doneButton = UIBarButtonItem(title: Configure.titleDoneButton, style: .done, target: self, action: #selector(processDone))
        navigationItem.rightBarButtonItem = doneButton
        nameTextField.text = name
        avatarImageView.image = imageName
    }
    
    @objc private func processDone() {
        guard let username = nameTextField.text else { return }
        delegate?.changeUser(self, changeName: .changeName(username, index))
        navigationController?.popViewController(animated: true)
    }
}
extension ProfileViewController {
    enum Action {
        case changeName(String, Int)
    }
}
