//
//  LoginViewController.swift
//  TabbarController
//
//  Created by Abcd on 8/12/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {
    
    //MARK: - IBoutlet
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var userNameTextField: UITextField!
    
    //MARK: - Properties
    var viewModel = LoginViewModel(userName: "trung", passWord: "123455")
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func setupUI() {
        super.setupUI()
        self.title = "Login"
        updateView()
    }
    func updateView(){
        userNameTextField.text = viewModel.userName
        passwordTextField.text = viewModel.passWord
    }
    @IBAction private func loginPressed(_ sender: UIButton) {
        let userName = userNameTextField.text ?? ""
        let passWord = passwordTextField.text ?? ""
        
        //tao gia tri cho closure
        let complete: LoginViewModel.Completion = {(result) in
            switch result {
            case .sucess:
                print("dang nhap thanh cong")
                self.updateView()
                let scene = UIApplication.shared.connectedScenes.first
                if let sd: SceneDelegate = (scene?.delegate as? SceneDelegate) {
                    sd.login()
                }
            case.failure(let isError, let errorMsg):
                if isError {
                    print("dang nhap that bai")
                    print(errorMsg)
                }
            }
        }
        //goi ham
        viewModel.login(userName: userName, passWord: passWord, completion: complete)
    }
}
