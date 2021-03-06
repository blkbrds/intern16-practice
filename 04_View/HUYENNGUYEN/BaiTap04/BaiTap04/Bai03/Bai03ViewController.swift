//  Bai03ViewController.swift
import UIKit

final class Bai03ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet var errorLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    
    enum LoginError: String {
        case notEnterData = "Bạn chưa nhập dữ liệu"
        case notEnterUserName = "Bạn chưa nhập username"
        case notEnterPassword = "Bạn chưa nhập password"
        case errorEnterData = "Nhập sai tên username hoặc password"
    }
    
    private let validUsername = "Admin"
    private let validPassword = "Admin123"
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        passwordTextField.delegate = self
        usernameTextField.delegate = self
        let tapToScreen = UITapGestureRecognizer(target: self, action: #selector(tapScreen(_:)))
        view.addGestureRecognizer(tapToScreen)
    }
    
    // MARK: - Private Methods
    private func initView() {
        setupTextField(textField: usernameTextField)
        setupTextField(textField: passwordTextField)
        setupButton(button: clearButton)
        setupButton(button: loginButton)
        
        errorLabel.isHidden = true
        passwordTextField.isSecureTextEntry = true
    }
    
    private func setupTextField(textField: UITextField) {
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 10
        textField.clipsToBounds = true
    }
    
    private func setupButton(button: UIButton) {
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
    }
    
    private func checkLogin() {
        let username = usernameTextField.text
        let password = passwordTextField.text
        let result: (String?, String?) = (username,password)
        switch result {
        case ("", ""), (nil, nil):
            errorLabel.text = LoginError.notEnterData.rawValue
        case ("", _):
            errorLabel.text = LoginError.notEnterUserName.rawValue
        case (_, ""):
            errorLabel.text = LoginError.notEnterPassword.rawValue
        case (validUsername, validPassword):
            errorLabel.text = "Đăng nhập thành công"
        default:
            errorLabel.text = LoginError.errorEnterData.rawValue
        }
    }
    
    // MARK: - IBAction
    @IBAction private func loginButtonAction(_ sender: UIButton) {
        checkLogin()
        errorLabel.isHidden = false
    }
    @IBAction private func clearButtonAction(_ sender: UIButton) {
        usernameTextField.text = nil
        passwordTextField.text = nil
        errorLabel.isHidden = true
    }
    
    // MARK: - objc
    @objc private func tapScreen(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
}

// MARK: -Extension
extension Bai03ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField === usernameTextField {
            passwordTextField.becomeFirstResponder()
        } else if textField === passwordTextField {
            checkLogin()
        }
        return true
    }
}
