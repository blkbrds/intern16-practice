//
//  LoginViewController.swift
//  TabbarController
//
//  Created by Abcd on 8/12/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    //MARK: - IBoutlet
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var userNameTextField: UITextField!
    
    //MARK: - Properties
    var viewModel = LoginViewModel(userName: "trung", passWord: "123")
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - config
//    override func setupUI(){
//        super.setupUI()
//        self.title = "Login"
//        updateView()
//    }
//
//    override func setupData(){
//
//    }
    
//    func updateView(){
//        userNameTextField.text = viewModel.userName
//        passwordTextField.text = viewModel.passWord
//    }
    @IBAction private func loginPressed(_ sender: UIButton) {
        let userName = userNameTextField.text ?? ""
        let passWord = passwordTextField.text ?? ""
        viewModel.login(userName: userName, passWord: passWord) { (done) in
            if done {
                print("dang nhap thanh cong")
            } else {
                print("dang nhap that bai")
            }
        }
    }
}
