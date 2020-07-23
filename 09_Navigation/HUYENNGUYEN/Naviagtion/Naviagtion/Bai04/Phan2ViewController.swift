//
//  Phan2ViewController.swift
//  Naviagtion
//
//  Created by bu on 7/23/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

class Phan2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    private func configUI(){
        title = "News Feed"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]

        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.2469934821, green: 0.3686577678, blue: 0.607765615, alpha: 1)
        
        let button1 = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.edit, target: self, action: #selector(handleClickEdit))
        navigationItem.rightBarButtonItem = button1
        button1.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        let button2 = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.search, target: self, action: #selector(handleClickSearch))
        navigationItem.leftBarButtonItem = button2
        button2.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    @objc func handleClickEdit(){}
    @objc func handleClickSearch(){}
}
