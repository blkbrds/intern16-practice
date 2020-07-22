//  LoginViewController.swift
//  Naviagtion
import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var errorLabel: UILabel!
    
    enum LoginError: String {
        case notEnterData = "Bạn chưa nhập dữ liệu"
        case notEnterUserName = "Bạn chưa nhập username"
        case notEnterPassword = "Bạn chưa nhập password"
        case errorEnterData = "Nhập sai tên username hoặc password"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    private func configView() {
        title = "LOGIN"
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneTouchUpInside))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    @objc func doneTouchUpInside() {
        if let path = Bundle.main.path(forResource: "dbAccount", ofType: "plist") {
            if let dic = NSDictionary(contentsOfFile: path) as? [String: String] {
                for account in dic {
                    let result: (String?, String?) = (usernameTextField.text, passwordTextField.text)
                    switch result {
                    case ("", ""), (nil, nil):
                        errorLabel.text = LoginError.notEnterData.rawValue
                    case ("", _):
                        errorLabel.text = LoginError.notEnterUserName.rawValue
                    case (_, ""):
                        errorLabel.text = LoginError.notEnterPassword.rawValue
                    case (account.key, account.value):
                        let homeViewController = HomeViewController()
                        homeViewController.name = account.key
                        navigationController?.pushViewController(homeViewController, animated: true)
                    default:
                        errorLabel.text = LoginError.errorEnterData.rawValue
                    }
                }
                
            }
        }
    }
}
