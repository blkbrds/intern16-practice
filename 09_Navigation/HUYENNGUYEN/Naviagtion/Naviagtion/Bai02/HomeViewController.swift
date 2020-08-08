//  HomeViewController.swift
//  Naviagtion
import UIKit

class HomeViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet private weak var usernameLabel: UILabel!
    
    // MARK: - Property
    private var name: String? = ""
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    // MARK: - Function
    private func configView(){
        title = "Home"
        let editButton = UIBarButtonItem(title: "Edit", style: .done, target: self, action: #selector(editTouchUpInside))
        navigationItem.rightBarButtonItem = editButton
        let logoutButton = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutTouchUpInside))
        navigationItem.leftBarButtonItem = logoutButton
        usernameLabel.text = name
    }
    
    // MARK: - Objc
    @objc func editTouchUpInside(){
        let editView = EditViewController()
        navigationController?.pushViewController(editView, animated: true)
    }
    
    @objc func logoutTouchUpInside(){
        navigationController?.popViewController(animated: true)
    }
}
