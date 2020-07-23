//  ProfileUserViewController.swift
//  Naviagtion

import UIKit

class ProfileUserViewController: UIViewController {
    
    @IBOutlet weak var usernameTextFiled: UITextField!
    var name: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    private func configUI(){
        title = "Profile"
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneTouchUpInside))
        navigationItem.rightBarButtonItem = doneButton
        usernameTextFiled.text = name
    }
    @objc func doneTouchUpInside(){}
}
