//  LoginViewController.swift
//  Naviagtion
import UIKit

protocol LoginViewControllerDelegate: class {
    func login(view: LoginViewController)
}

class LoginViewController: BaseViewController {
    
    // MARK: - IBOutlet
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var errorLabel: UILabel!
    
    // MARK: - Enum
    enum LoginError: String {
        case notEnterData = "Bạn chưa nhập dữ liệu"
        case notEnterUserName = "Bạn chưa nhập username"
        case notEnterPassword = "Bạn chưa nhập password"
        case errorEnterData = "Nhập sai tên username hoặc password"
    }
    
    // MARK: - Delegate
    weak var delegate: LoginViewControllerDelegate?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    // MARK: - Function
    private func configView() {
        title = "LOGIN"
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneTouchUpInside))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    // MARK: - Objc
    @objc private func doneTouchUpInside() {
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
                        UserDefaults.standard.set(account.key, forKey: "userName")
                        SceneDelegate.shared.changeRootViewController(changeRoot: .tabbar)
                    default:
                        errorLabel.text = LoginError.errorEnterData.rawValue
                    }
                }
            }
        }
    }
}
