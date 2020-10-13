//
//  DiaDiemViewController.swift
//  Baitap10Protocol
//
//  Created by MBA0245P on 10/13/20.
//  Copyright © 2020 Tran Thao Nguyen. All rights reserved.
//

import UIKit

class DiaDiemViewController: UIViewController {
    
    @IBOutlet weak var mienDetailLabel: UILabel!
    
    @IBOutlet weak var tinhDetailLabel: UILabel!
    
    @IBOutlet weak var huyenDetailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Địa Điểm"
        
        let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editAction))
        navigationItem.rightBarButtonItem = editButton
        
    }

    @objc func editAction() {
        
    }

}
