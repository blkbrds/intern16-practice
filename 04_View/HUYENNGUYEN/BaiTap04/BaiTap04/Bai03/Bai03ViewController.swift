//  Bai03ViewController.swift
import UIKit

class Bai03ViewController: UIViewController {
    
    @IBOutlet weak var txtUserName: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet var lbError: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBOutlet weak var btnLogin: UIButton!
    @IBAction func btnLoginAction(_ sender: Any) {
        if (txtUserName.text?.contains("admin"))! && (txtPassword.text?.contains("admin123"))! {lbError.isHidden = false}
        else {lbError.isHidden = true}
    }
    
    
    @IBOutlet weak var btnClear: UIButton!
    @IBAction func btnClearAction(_ sender: Any) {
        txtUserName.text = ""
        txtPassword.text = ""
    }
    
}
