//
//  UserDetailsViewController.swift
//  Navigation
//
//  Created by PCI0007 on 7/20/20.
//  Copyright © 2020 Chipuscu. All rights reserved.
//

import UIKit

//protocol UserDetailsDelegate: class {
//    func userDetails(viewController: UserDetailsViewController, data: Data, index: Int)
//}

class UserDetailsViewController: UIViewController {
    
    @IBOutlet weak var editNameTextField: UITextField!
    var userName:String = "user name"
//    var data: Data
    var index: Int = 0
//    
//    weak var delegate: UserDetailsDelegate?
    
//    init(data: Data, index: Int) {
//        userName = data.name
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Detail"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(finishExit))
        editNameTextField.text = userName
    }
    
    @objc func finishExit() {
        let viewControllers = navigationController?.viewControllers
        for vc in viewControllers! {
            if let profilesViewController = vc as? UserProfileViewController {
                for i in 0..<profilesViewController.datas.count {
                    if profilesViewController.datas[i].name == userName {
                        profilesViewController.datas[i].name = editNameTextField.text!
                        profilesViewController.scrollView.removeFromSuperview()
                    }
//                    delegate?.userDetails(viewController: self, update: profilesViewController.datas[i].name)
                    navigationController?.popViewController(animated: true)
                }
            }
        }
    }
    
//    @objc func tapToDone() {
//        let data: Data
//        data.name = editNameTextField.text!
//        delegate?.userDetails(viewController: self, data: data, index: <#T##Int#>)
//    }
}
