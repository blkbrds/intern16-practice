//  ProfileUserViewController.swift
//  Naviagtion

import UIKit

protocol ProfileUserViewControllerDelegate: class {
    func controller(controller: ProfileUserViewController, needPerformAction action: ProfileUserViewController.Action)
}

class ProfileUserViewController: UIViewController {
    // MARK: - Enum
    enum Action {
        case updateName(nameUpdate: String?, index: Int)
    }
    
    // MARK: - IBOutlet
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var usernameTextFiled: UITextField!
    
    // MARK: - Properties
    var name: String = ""
    var imageView: String = ""
    var index: Int?
    weak var delegate: ProfileUserViewControllerDelegate?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    // MARK: - Function
    private func configUI() {
        title = "Profile"
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneTouchUpInside))
        navigationItem.rightBarButtonItem = doneButton
        
        avatarImageView.image = UIImage(named: "user")
        usernameTextFiled.text = name
    }
    
    // MARK: - Objc
    @objc private func doneTouchUpInside() {
        navigationController?.popToRootViewController(animated: true)
        if let delegate = delegate, let index = index {
            delegate.controller(controller: self, needPerformAction: .updateName(nameUpdate: usernameTextFiled.text, index: index))
        }
    }
}

