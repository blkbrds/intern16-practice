//
//  HomeViewController.swift
//  Bai2Navigation
//
//  Created by Trung Le D. on 7/21/20.
//  Copyright © 2020 Trung Le D. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var userNameLabel: UILabel!
    var userName = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "HOME"
        // Do any additional setup after loading the view.
        let logout = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutButton))
        navigationItem.leftBarButtonItem = logout
        let edit = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editButton))
        navigationItem.rightBarButtonItem = edit
        userNameLabel.text = userName
    }
    
    @objc func logoutButton() {
        navigationController?.popViewController(animated: true)
    }
    @objc func editButton() {
        navigationController?.pushViewController( EditViewController(), animated: true)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
