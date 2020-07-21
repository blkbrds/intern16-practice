//
//  HomeViewController.swift
//  Bai2Navigation
//
//  Created by Trung Le D. on 7/21/20.
//  Copyright © 2020 Trung Le D. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "HOME"
        // Do any additional setup after loading the view.
        let logout = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutButton))
        let edit = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editButton))
              navigationItem.rightBarButtonItems = [logout,edit]
    }
    
    @objc func logoutButton() {
        print("logout")
    }
    @objc func editButton() {
        print("edit")
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
