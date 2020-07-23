//
//  Phan3ViewController.swift
//  Naviagtion
//
//  Created by bu on 7/23/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

class Phan3ViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    private func configUI(){
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.titleView = searchBar
    }
}
